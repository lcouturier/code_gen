// ignore_for_file: depend_on_referenced_packages, implementation_imports

import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/build.dart';

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import 'package:source_gen/source_gen.dart';

class TestSteroidsGenerator extends GeneratorForAnnotation<SteroidsEnum> {
  @override
  FutureOr<String> generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    final testClass = Class(
      (c) => c
        ..name = 'TestEnum'
        ..methods.add(
          Method(
            (m) => m
              ..name = 'test'
              ..returns = refer('void')
              ..body = const Code('''
          final result = _myClass.test(1, 2);
          expect(result, equals(3));
        '''),
          ),
        )
        ..build(),
    );

    // for (final method in classElements[0].methods) {
    //   final testName = '${method.name} test';

    //   final testMethod = Method(
    //     (m) => m
    //       ..name = testName
    //       ..returns = refer('void')
    //       ..body = Code('''
    //       final result = _myClass.${method.name}(1, 2);
    //       expect(result, equals(3));
    //     '''),
    //   );

    //   //testClass.methods.add(testMethod);
    // }

    final emitter = DartEmitter();
    return DartFormatter().format('${testClass.accept(emitter)}');
  }
}
