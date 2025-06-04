// Copyright (c) 2018, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// ignore_for_file: implementation_imports, avoid_positional_boolean_parameters, prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation, missing_whitespace_between_adjacent_strings, deprecated_member_use

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart'; // Changed from build/src/builder/build_step.dart
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:source_gen/source_gen.dart';

class UnitTestGenerator extends Generator {
  static Method _generateTestsForEnum(EnumElement element) {
    final enumName = element.name;
    final enumFields = element.fields.where((e) => e.isEnumConstant).toList();

    final tests = <Expression>[];

    // Test cases for 'when'
    for (final field in enumFields) {
      final valueUnderTest = refer(enumName).property(field.name);
      final expectedResult = literalString(field.name); // For when, we expect the string representation of the value name
      final whenArgs = <String, Expression>{};
      for (final f in enumFields) {
        whenArgs[f.name] = Method((b) => b..body = expectedResult.code).closure;
      }
      final whenCall = valueUnderTest.property('when').call([], whenArgs);
      tests.add(_createTestStatement(
        "'when' for ${field.name}",
        valueUnderTest,
        whenCall,
        expectedResult,
      ));
    }

    // Test cases for 'map'
    for (final field in enumFields) {
      final valueUnderTest = refer(enumName).property(field.name);
      // For map, we expect the string representation of 'EnumName.valueName'
      final expectedResult = literalString('$enumName.${field.name}');
      final mapArgs = <String, Expression>{};
      for (final f in enumFields) {
        mapArgs[f.name] = Method((b) => b
          ..requiredParameters.add(Parameter((p) => p..name = 'e'))
          ..body = refer('e').property('toString').call([]).code).closure;
      }
      final mapCall = valueUnderTest.property('map').call([], mapArgs);
      tests.add(_createTestStatement(
        "'map' for ${field.name}",
        valueUnderTest,
        mapCall,
        expectedResult,
      ));
    }

    // Test cases for 'maybeWhen'
    for (final field in enumFields) {
      final valueUnderTest = refer(enumName).property(field.name);
      final expectedResult = literalString(field.name);
      final whenArgs = <String, Expression>{};
      // Only provide handler for the current field
      whenArgs[field.name] = Method((b) => b..body = expectedResult.code).closure;
      whenArgs['orElse'] = Method((b) => b..body = literalString('orElseResult').code).closure;

      final maybeWhenCall = valueUnderTest.property('maybeWhen').call([], whenArgs);
      tests.add(_createTestStatement(
        "'maybeWhen' for ${field.name} (matching case)",
        valueUnderTest,
        maybeWhenCall,
        expectedResult,
      ));

      // Test orElse case for maybeWhen
      if (enumFields.length > 1) {
        final otherField = enumFields.firstWhere((f) => f.name != field.name);
        final orElseArgs = <String, Expression>{};
        orElseArgs[otherField.name] = Method((b) => b..body = literalString(otherField.name).code).closure;
        orElseArgs['orElse'] = Method((b) => b..body = literalString('orElseResult').code).closure;
        final orElseCall = valueUnderTest.property('maybeWhen').call([], orElseArgs);
        tests.add(_createTestStatement(
          "'maybeWhen' for ${field.name} (orElse case)",
          valueUnderTest,
          orElseCall,
          literalString('orElseResult'),
        ));
      } else { // Single value enum, orElse will be hit if no handler for the value itself
         final orElseArgs = <String, Expression>{};
         orElseArgs['orElse'] = Method((b) => b..body = literalString('orElseResultSingle').code).closure;
         final orElseCall = valueUnderTest.property('maybeWhen').call([], orElseArgs);
         tests.add(_createTestStatement(
          "'maybeWhen' for ${field.name} (orElse single enum value)",
          valueUnderTest,
          orElseCall,
          literalString('orElseResultSingle'),
        ));
      }
    }

    // Test cases for 'maybeMap'
    for (final field in enumFields) {
      final valueUnderTest = refer(enumName).property(field.name);
      final expectedString = '$enumName.${field.name}';
      final expectedResult = literalString(expectedString);
      final mapArgs = <String, Expression>{};
      mapArgs[field.name] = Method((b) => b
        ..requiredParameters.add(Parameter((p) => p..name = 'e'))
        ..body = refer('e').property('toString').call([]).code).closure;
      mapArgs['orElse'] = Method((b) => b..body = literalString('orElseResult').code).closure;

      final maybeMapCall = valueUnderTest.property('maybeMap').call([], mapArgs);
      tests.add(_createTestStatement(
        "'maybeMap' for ${field.name} (matching case)",
        valueUnderTest,
        maybeMapCall,
        expectedResult,
      ));

      // Test orElse case for maybeMap
      if (enumFields.length > 1) {
        final otherField = enumFields.firstWhere((f) => f.name != field.name);
        final orElseMapArgs = <String, Expression>{};
        orElseMapArgs[otherField.name] = Method((b) => b
          ..requiredParameters.add(Parameter((p) => p..name = 'e'))
          ..body = refer('e').property('toString').call([]).code).closure;
        orElseMapArgs['orElse'] = Method((b) => b..body = literalString('orElseResult').code).closure;
        final orElseMapCall = valueUnderTest.property('maybeMap').call([], orElseMapArgs);
        tests.add(_createTestStatement(
          "'maybeMap' for ${field.name} (orElse case)",
          valueUnderTest,
          orElseMapCall,
          literalString('orElseResult'),
        ));
      } else { // Single value enum, orElse will be hit if no handler for the value itself
        final orElseMapArgs = <String, Expression>{};
        orElseMapArgs['orElse'] = Method((b) => b..body = literalString('orElseResultSingleMap').code).closure;
        final orElseMapCall = valueUnderTest.property('maybeMap').call([], orElseMapArgs);
        tests.add(_createTestStatement(
          "'maybeMap' for ${field.name} (orElse single enum value)",
          valueUnderTest,
          orElseMapCall,
          literalString('orElseResultSingleMap'),
        ));
      }
    }

    // Test cases for 'is<Value>'
    for (final field in enumFields) {
      final valueUnderTest = refer(enumName).property(field.name);
      for (final isField in enumFields) {
        final isMethodName = 'is${isField.name[0].toUpperCase()}${isField.name.substring(1)}';
        final isCall = valueUnderTest.property(isMethodName);
        final expectedBool = literalBool(field.name == isField.name);
        tests.add(_createTestStatement(
          "'${isMethodName}' for ${field.name}",
          valueUnderTest,
          isCall, // This is the call itself, not a method call expression
          expectedBool,
          isGetter: true,
        ));
      }
    }

    // Test cases for 'fromName'
    for (final field in enumFields) {
      final fieldName = field.name;
      final valueUnderTest = refer(enumName); // Static method, so refers to enum type
      // Test exact name
      tests.add(_createTestStatement(
        "'fromName' for '$fieldName'",
        valueUnderTest,
        valueUnderTest.property('fromName').call([literalString(fieldName)]),
        refer(enumName).property(fieldName),
      ));
      // Test lowercase
      tests.add(_createTestStatement(
        "'fromName' for '${fieldName.toLowerCase()}' (case-insensitive)",
        valueUnderTest,
        valueUnderTest.property('fromName').call([literalString(fieldName.toLowerCase())]),
        refer(enumName).property(fieldName),
      ));
      // Test uppercase
      tests.add(_createTestStatement(
        "'fromName' for '${fieldName.toUpperCase()}' (case-insensitive)",
        valueUnderTest,
        valueUnderTest.property('fromName').call([literalString(fieldName.toUpperCase())]),
        refer(enumName).property(fieldName),
      ));
    }
    // Test 'fromName' with invalid name
    tests.add(
      refer('test').call([
        literalString("'fromName' with invalid name throws ArgumentError"),
        Method((b) => b
          ..body = refer('expect')
              .call([
                Method((b) => b..body = refer(enumName).property('fromName').call([literalString('InvalidName')]).code).closure,
                refer('throwsA').call([refer('isA').call([], {}, [refer('ArgumentError')])]),
              ])
              .statement
        ]).closure
      ])
    );

    // Test cases for 'fromOrdinal'
    for (int i = 0; i < enumFields.length; i++) {
      final field = enumFields[i];
      final valueUnderTest = refer(enumName); // Static method
      tests.add(_createTestStatement(
        "'fromOrdinal' for ordinal $i returns ${field.name}",
        valueUnderTest,
        valueUnderTest.property('fromOrdinal').call([literalNum(i)]),
        refer(enumName).property(field.name),
      ));
    }
    // Test 'fromOrdinal' with out-of-bounds ordinal (negative)
    tests.add(
      refer('test').call([
        literalString("'fromOrdinal' with -1 throws ArgumentError"),
        Method((b) => b
          ..body = refer('expect')
              .call([
                Method((b) => b..body = refer(enumName).property('fromOrdinal').call([literalNum(-1)]).code).closure,
                refer('throwsA').call([refer('isA').call([], {}, [refer('ArgumentError')])]),
              ])
              .statement
        ]).closure
      ])
    );
    // Test 'fromOrdinal' with out-of-bounds ordinal (too large)
    tests.add(
      refer('test').call([
        literalString("'fromOrdinal' with ${enumFields.length} throws ArgumentError"),
        Method((b) => b
          ..body = refer('expect')
              .call([
                Method((b) => b..body = refer(enumName).property('fromOrdinal').call([literalNum(enumFields.length)]).code).closure,
                refer('throwsA').call([refer('isA').call([], {}, [refer('ArgumentError')])]),
              ])
              .statement
        ]).closure
      ])
    );

    final bodyCode = Block.of(tests.map((t) => t.statement));

    return Method((b) => b
      ..name = '_test${element.name}' // Private method to avoid name clashes
      ..returns = refer('void')
      ..body = Block.of([
        refer('group').call([literalString(element.name)], {
          'body': Method((b) => b..body = bodyCode).closure,
        }).statement,
      ]));
  }

  static Expression _createTestStatement(
    String description,
    Expression valueUnderTest,
    Expression methodOrGetterCall,
    Expression expectedResult, {
    bool isGetter = false,
  }) {
    return refer('test').call([
      literalString(description),
      Method((b) => b
        ..body = Block.of([
          isGetter
              ? declareFinal('result').assign(methodOrGetterCall).statement
              : declareFinal('result').assign(methodOrGetterCall).statement, // No change needed, assign works for getters too
          refer('expect').call([refer('result'), expectedResult]).statement,
        ])).closure
    ]);
  }

  // _getSourceCode is no longer needed as its logic is integrated into _generateTestsForEnum
  // static List<String> _getSourceCode(EnumElement element, bool isMayBe, bool isMap) {
  //   final fields = element.fields.where((e) => e.isEnumConstant).map((e) => e.name);

  //   final methodName = isMap ? "map" : "when";
  //   final lines = ['const value = ${element.name}.${fields.first};'] +
  //       ['final result = value.$methodName('] +
  //       (isMayBe
  //           ? fields.take(1).map((e) => isMap ? '$e: (e) => e.toString(),' : "$e: () => '$e',").toList() +
  //               ["orElse: () => 'default'"]
  //           : fields.map((e) => isMap ? '$e: (e) => e.toString(),' : "$e: () => '$e',").toList()) +
  //       [');'] +
  //       ['expect(result, "${fields.first}");'];
  //   return lines;
  // }

  @override
  String generate(LibraryReader library, BuildStep buildStep) {
    final enums = library.enums.toList();

    if (enums.isEmpty) {
      return ''; // Return empty string if no enums are found
    }

    final libraryBuilder = LibraryBuilder();

    // Add imports
    libraryBuilder.directives.addAll([
      Directive.import('package:test/test.dart'),
      Directive.import(buildStep.inputId.pathSegments.last), // Import the source file
    ]);

    final mainMethodBuilder = MethodBuilder()
      ..name = 'main'
      ..returns = refer('void');

    final List<Code> mainMethodStatements = [];

    for (final element in enums) {
      final enumTestRegistrar = _generateTestsForEnum(element);
      libraryBuilder.body.add(enumTestRegistrar); // Add the _testMyEnum function
      mainMethodStatements.add(refer(enumTestRegistrar.name!).call([]).statement); // Call _testMyEnum() in main
    }
    mainMethodBuilder.body = Block.of(mainMethodStatements);
    libraryBuilder.body.add(mainMethodBuilder.build());


    final emitter = DartEmitter(useNullSafetySyntax: true); // Enable null safety
    return DartFormatter(languageVersion: DartFormatter.latestLanguageVersion)
        .format('${libraryBuilder.build().accept(emitter)}');
  }
}
