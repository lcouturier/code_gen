// ignore_for_file: require_trailing_commas

import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:generators/src/core/string_utilities.dart';
import 'package:source_gen/source_gen.dart';

class EnumPatternMatchingCodeGenerator {
  EnumPatternMatchingCodeGenerator(this.element) {
    fields = element.fields.where((e) => e.isEnumConstant).toList();
  }

  late List<FieldElement> fields;
  final EnumElement element;

  String generate() {
    try {
      final annotation = getAnnotation(element);
      final cls = Extension((c) {
        c
          ..name = ('Extension${element.name}')
          ..on = Reference(element.name)
          ..methods.addAll(getAllCheckers(annotation.hasChecker, element.name, fields.map((e) => e.name).toList()));
        if (annotation.hasWhen) {
          c.methods.add(generateWhenMethod);
        }
        if (annotation.hasMap) {
          c.methods.add(generateMapMethod);
        }
        if (annotation.hasMaybeWhen) {
          c.methods.add(generateMayBeWhenMethod);
        }
        if (annotation.hasMaybeMap) {
          c.methods.add(generateMayBeMapMethod);
        }
        c.build();
      });

      final emitter = DartEmitter();
      return DartFormatter().format('${cls.accept(emitter)}');
    } catch (e, _) {
      return '/*$e*/';
    }
  }

  static SteroidsEnum getAnnotation(EnumElement element) {
    final annotation = const TypeChecker.fromRuntime(SteroidsEnum).firstAnnotationOf(element);

    SteroidsEnum getCore() {
      final reader = ConstantReader(annotation);
      final hasChecker = reader.read('hasChecker').literalValue as bool?;
      final hasWhen = reader.read('hasWhen').literalValue as bool?;
      final hasMap = reader.read('hasMap').literalValue as bool?;
      final hasMaybeWhen = reader.read('hasMaybeWhen').literalValue as bool?;
      final hasMaybeMap = reader.read('hasMaybeMap').literalValue as bool?;

      return SteroidsEnum(
        hasChecker: hasChecker ?? true,
        hasWhen: hasWhen ?? true,
        hasMap: hasMap ?? true,
        hasMaybeWhen: hasMaybeWhen ?? true,
        hasMaybeMap: hasMaybeMap ?? true,
      );
    }

    return (annotation != null) ? getCore() : const SteroidsEnum();
  }

  // ignore: avoid_positional_boolean_parameters
  static Iterable<Method> getAllCheckers(bool hasChecker, String elementName, List<String> names) {
    return hasChecker
        ? names.map(StringUtilities.toCamelCase).map((e) {
            return Method((m) {
              m
                ..name = 'is${StringUtilities.toPascalCase(e)}'
                ..lambda = true
                ..returns = const Reference('bool')
                ..type = MethodType.getter
                ..body = Code('this == $elementName.$e')
                ..docs.addAll(<String>['/// Whether this is equal to  $elementName.$e.'])
                ..build();
            });
          })
        : <Method>[];
  }

  static Iterable<String> getComment(
      {required String method,
      required bool isMap,
      required bool isMayBe,
      required String element,
      required List<String> fields}) {
    final header = [
      '/// Use $method method when you want to perform some action based on the enum',
      '///',
      '/// ```dart'
    ];

    return header +
        ['/// $element value = $element.${fields.first};'] +
        ['/// final result = value.$method('] +
        (isMayBe
            ? fields.take(1).map((e) => isMap ? '///  $e: (e) => e.toString(),' : "///  $e: () => '$e',").toList() +
                ["///  orElse: () => 'default'"]
            : fields.map((e) => isMap ? '///  $e: (e) => e.toString(),' : "///  $e: () => '$e',").toList()) +
        ['/// );'] +
        ['/// ```'];
  }

  Method get generateMapMethod {
    final bodyBuffer = StringBuffer()
      ..writeln()
      ..writeln('switch(this) {');
    for (final field in fields) {
      bodyBuffer
        ..writeln('case ${element.name}.${field.name}:')
        ..writeln('return ${field.name}(this);');
    }
    bodyBuffer.writeln('}');

    final params = <Parameter>[];
    for (final field in fields) {
      params.add(
        Parameter((p) {
          p
            ..name = StringUtilities.toCamelCase(field.name)
            ..named = true
            ..required = true
            ..type = refer('T Function(${element.name})')
            ..build();
        }),
      );
    }

    return Method(
      (m) => m
        ..name = 'map'
        ..types.add(const Reference('T'))
        ..returns = const Reference('T')
        ..optionalParameters.addAll(params)
        ..body = Code(bodyBuffer.toString())
        ..docs.addAll(
          getComment(
            method: 'map',
            isMap: true,
            isMayBe: false,
            element: element.name,
            fields: fields.map((e) => e.name).toList(),
          ),
        )
        ..build(),
    );
  }

  Method get generateWhenMethod {
    final bodyBuffer = StringBuffer()
      ..writeln()
      ..writeln('switch(this) {');
    for (final field in fields) {
      bodyBuffer
        ..writeln('case ${element.name}.${field.name}:')
        ..writeln('return ${field.name}();');
    }
    bodyBuffer.writeln('}');

    final params = <Parameter>[];
    for (final field in fields) {
      params.add(
        Parameter((p) {
          p
            ..name = StringUtilities.toCamelCase(field.name)
            ..named = true
            ..required = true
            ..type = refer('T Function()')
            ..build();
        }),
      );
    }

    return Method(
      (m) => m
        ..name = 'when'
        ..types.add(const Reference('T'))
        ..returns = const Reference('T')
        ..optionalParameters.addAll(params)
        ..body = Code(bodyBuffer.toString())
        ..docs.addAll(
          getComment(
            method: 'when',
            isMap: false,
            isMayBe: false,
            element: element.name,
            fields: fields.map((e) => e.name).toList(),
          ),
        )
        ..build(),
    );
  }

  Method get generateMayBeWhenMethod {
    final assertionCondition = fields.map((f) => '${StringUtilities.toCamelCase(f.name)} == null').join(' && ');

    final bodyBuffer = StringBuffer()
      ..write(
        'assert(() { '
        "if ($assertionCondition) {throw 'check for at least one case';} "
        'return true; '
        '}());',
      )
      ..writeln('final items = {');
    for (final field in fields) {
      bodyBuffer.writeln('${element.name}.${field.name}  : ${field.name},');
    }
    bodyBuffer
      ..writeln('};')
      ..writeln('return items[this]?.call() ?? orElse();');

    final params = <Parameter>[];
    for (final field in fields) {
      params.add(
        Parameter((p) {
          p
            ..name = StringUtilities.toCamelCase(field.name)
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

    return Method(
      (m) => m
        ..name = 'mayBeWhen'
        ..types.add(const Reference('T'))
        ..returns = const Reference('T')
        ..optionalParameters.addAll(params)
        ..body = Code(bodyBuffer.toString())
        ..docs.addAll(
          getComment(
            method: 'mayBeWhen',
            isMap: false,
            isMayBe: true,
            element: element.name,
            fields: fields.map((e) => e.name).toList(),
          ),
        )
        ..build(),
    );
  }

  Method get generateMayBeMapMethod {
    final assertionCondition = fields.map((f) => '${StringUtilities.toCamelCase(f.name)} == null').join(' && ');
    final bodyBuffer = StringBuffer()
      ..write(
        'assert(() { '
        "if ($assertionCondition) {throw 'check for at least one case';} "
        'return true; '
        '}());',
      )
      ..writeln('final items = {');
    for (final field in fields) {
      bodyBuffer.writeln('${element.name}.${field.name}  : ${field.name},');
    }
    bodyBuffer
      ..writeln('};')
      ..writeln('return items[this]?.call(this) ?? orElse();');

    final params = <Parameter>[];
    for (final field in fields) {
      params.add(
        Parameter((p) {
          p
            ..name = StringUtilities.toCamelCase(field.name)
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

    return Method(
      (m) => m
        ..name = 'mayBeMap'
        ..types.add(const Reference('T'))
        ..returns = const Reference('T')
        ..optionalParameters.addAll(params)
        ..body = Code(bodyBuffer.toString())
        ..docs.addAll(
          getComment(
            method: 'mayBeMap',
            isMap: true,
            isMayBe: true,
            element: element.name,
            fields: fields.map((e) => e.name).toList(),
          ),
        )
        ..build(),
    );
  }
}
