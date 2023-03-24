// ignore_for_file: avoid_print, missing_whitespace_between_adjacent_strings, cascade_invocations

import 'package:analyzer/dart/element/element.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

class ClassGenerator {
  ClassGenerator(this.element) {
    fields = element.fields.where((e) => e.isEnumConstant).toList();
  }

  late List<FieldElement> fields;
  final EnumElement element;

  String generate() {
    try {
      final cls = Extension(
        (c) => c
          ..name = ('Extension${element.name}')
          ..on = Reference(element.name)
          ..methods.addAll(getAllCheckers(element.name, fields.map((e) => e.name).toList()))
          ..methods.add(generateWhenMethod)
          ..methods.add(generateMapMethod)
          ..methods.add(generateMayBeWhenMethod)
          ..methods.add(generateMayBeMapMethod)
          ..build(),
      );

      final emitter = DartEmitter();
      return DartFormatter().format('${cls.accept(emitter)}');
    } catch (e, _) {
      return "/*$e*/";
    }
  }

  static Iterable<Method> getAllCheckers(String elementName, List<String> names) {
    return names.map(toCamelCase).map((e) {
      return Method((m) {
        m
          ..name = 'is${toPascalCase(e)}'
          ..lambda = true
          ..returns = const Reference('bool')
          ..type = MethodType.getter
          ..body = Code('this == $elementName.$e')
          ..build();
      });
    });
  }

  Method get generateMapMethod {
    final params = <Parameter>[];
    final bodyBuffer = StringBuffer();

    bodyBuffer.writeln('switch(this) {');

    for (final field in fields) {
      bodyBuffer
        ..writeln('case ${element.name}.${field.name}:')
        ..writeln('return ${field.name}(this);');

      params.add(
        Parameter((p) {
          p
            ..name = toCamelCase(field.name)
            ..named = true
            ..required = true
            ..type = refer('T Function(${element.name})')
            ..build();
        }),
      );
    }

    bodyBuffer.writeln('}');

    return Method(
      (m) => m
        ..name = 'map'
        ..types.add(const Reference('T'))
        ..returns = const Reference('T')
        ..optionalParameters.addAll(params)
        ..body = Code(bodyBuffer.toString())
        ..build(),
    );
  }

  Method get generateWhenMethod {
    final params = <Parameter>[];
    final bodyBuffer = StringBuffer();

    bodyBuffer.writeln('switch(this) {');

    for (final field in fields) {
      bodyBuffer
        ..writeln('case ${element.name}.${field.name}:')
        ..writeln('return ${field.name}();');

      params.add(
        Parameter((p) {
          p
            ..name = toCamelCase(field.name)
            ..named = true
            ..required = true
            ..type = refer('T Function()')
            ..build();
        }),
      );
    }

    bodyBuffer.writeln('}');

    return Method(
      (m) => m
        ..name = 'when'
        ..types.add(const Reference('T'))
        ..returns = const Reference('T')
        ..optionalParameters.addAll(params)
        ..body = Code(bodyBuffer.toString())
        ..build(),
    );
  }

  Method get generateMayBeWhenMethod {
    final params = <Parameter>[];
    final bodyBuffer = StringBuffer();

    final assertionCondition = fields.map((f) => '${toCamelCase(f.name)} == null').join(' && ');

    bodyBuffer.write(
      "assert(() {"
      "if ($assertionCondition) {throw 'check for at least one case';}"
      "return true;"
      "}());",
    );

    bodyBuffer.writeln('final items = {');

    for (final field in fields) {
      bodyBuffer.writeln('${element.name}.${field.name}  : ${field.name},');

      params.add(
        Parameter((p) {
          p
            ..name = toCamelCase(field.name)
            ..named = true
            ..required = false
            ..type = refer('T Function()?')
            ..build();
        }),
      );
    }
    params.add(
      Parameter((p) {
        p
          ..name = 'orElse'
          ..named = true
          ..required = true
          ..type = refer('T Function()')
          ..build();
      }),
    );

    bodyBuffer.writeln('};');

    bodyBuffer
      ..writeln('final f = items[this];')
      ..writeln('return (f != null) ? f() : orElse();');

    return Method(
      (m) => m
        ..name = 'mayBeWhen'
        ..types.add(const Reference('T'))
        ..returns = const Reference('T')
        ..optionalParameters.addAll(params)
        ..body = Code(bodyBuffer.toString())
        ..build(),
    );
  }

  Method get generateMayBeMapMethod {
    final params = <Parameter>[];
    final bodyBuffer = StringBuffer();

    final assertionCondition = fields.map((f) => '${toCamelCase(f.name)} == null').join(' && ');

    bodyBuffer.write(
      "assert(() {"
      "if ($assertionCondition) {throw 'check for at least one case';}"
      "return true;"
      "}());",
    );

    bodyBuffer.writeln('final items = {');

    for (final field in fields) {
      bodyBuffer.writeln('${element.name}.${field.name}  : ${field.name},');

      params.add(
        Parameter((p) {
          p
            ..name = toCamelCase(field.name)
            ..named = true
            ..required = false
            ..type = refer('T Function(${element.name})?')
            ..build();
        }),
      );
    }
    params.add(
      Parameter((p) {
        p
          ..name = 'orElse'
          ..named = true
          ..required = true
          ..type = refer('T Function()')
          ..build();
      }),
    );

    bodyBuffer.writeln('};');

    bodyBuffer
      ..writeln('final f = items[this];')
      ..writeln('return (f != null) ? f(this) : orElse();');

    return Method(
      (m) => m
        ..name = 'mayBeMap'
        ..types.add(const Reference('T'))
        ..returns = const Reference('T')
        ..optionalParameters.addAll(params)
        ..body = Code(bodyBuffer.toString())
        ..build(),
    );
  }

  static String toCamelCase(String str) {
    if (str.isEmpty) return str;

    final words = str.split(RegExp(r'[_\- ]'));
    final firstWord = words.removeAt(0);
    final camelCaseWords = words.map((word) => word.substring(0, 1).toUpperCase() + word.substring(1).toLowerCase());

    return '$firstWord${camelCaseWords.join()}';
  }

  static String toPascalCase(String str) {
    if (str.isEmpty) return str;

    final words = str.split(RegExp(r'[_\- ]'));
    final pascalCaseWords = words.map((word) => word.substring(0, 1).toUpperCase() + word.substring(1).toLowerCase());

    return pascalCaseWords.join();
  }
}
