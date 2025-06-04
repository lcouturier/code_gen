// Copyright (c) 2018, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// ignore_for_file: implementation_imports, avoid_positional_boolean_parameters, prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation, missing_whitespace_between_adjacent_strings, deprecated_member_use

import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:source_gen/source_gen.dart';

class UnitTestGenerator extends Generator {
  static Code getCode(EnumElement element) {
    final whenLines = _getSourceCode(element, false, false);
    final mapLines = _getSourceCode(element, false, true);
    final mayBeWhenLines = _getSourceCode(element, true, false);
    final mayBeMapLines = _getSourceCode(element, true, true);

    return Code(
      "test('when', () { ${whenLines.join('\n')} });\n\n" +
          "test('map', () { ${mapLines.join('\n')} });\n\n" +
          "test('mayBeWhen', () { ${mayBeWhenLines.join('\n')} });\n\n" +
          "test('mayBeMap', () { ${mayBeMapLines.join('\n')} });\n\n",
    );
  }

  static List<String> _getSourceCode(EnumElement element, bool isMayBe, bool isMap) {
    final fields = element.fields.where((e) => e.isEnumConstant).map((e) => e.name);

    final methodName = isMap ? "map" : "when";
    final lines = ['const value = ${element.name}.${fields.first};'] +
        ['final result = value.$methodName('] +
        (isMayBe
            ? fields.take(1).map((e) => isMap ? '$e: (e) => e.toString(),' : "$e: () => '$e',").toList() +
                ["orElse: () => 'default'"]
            : fields.map((e) => isMap ? '$e: (e) => e.toString(),' : "$e: () => '$e',").toList()) +
        [');'] +
        ['expect(result, "${fields.first}");'];
    return lines;
  }

  @override
  String generate(LibraryReader library, BuildStep buildStep) {
    final items = library.enums.toList();

    for (final element in items) {
      final mainMethod = MethodBuilder()
        ..name = 'main'
        ..returns = refer('void')
        ..requiredParameters.add(
          Parameter(
            (b) => b
              ..name = 'args'
              ..type = refer('List')
              ..types.addAll([refer('String')]),
          ),
        )
        ..body = getCode(element);

      final emitter = DartEmitter();
      return DartFormatter(languageVersion: DartFormatter.latestLanguageVersion)
          .format('${mainMethod.build().accept(emitter)}');
    }

    return '';

    // final items = library.enums.toList();

    // for (final element in items) {
    //   final code = getCode(element);

    //   final main = Method((c) {
    //     c
    //       ..name = 'main'
    //       ..returns = refer('void')
    //       ..body = code;
    //   });
    //   final emitter = DartEmitter();
    //   return DartFormatter().format('${main.accept(emitter)}');
    // }
    // return '';
  }
}
