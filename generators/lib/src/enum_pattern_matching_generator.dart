// ignore_for_file: depend_on_referenced_packages, implementation_imports

import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/src/builder/build_step.dart';

import 'package:generators/src/enum_pattern_matching_code_generator.dart';
import 'package:source_gen/source_gen.dart';

class EnumPatternMatchingGenerator extends GeneratorForAnnotation<SteroidsEnum> {
  @override
  FutureOr<String> generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element.kind == ElementKind.ENUM && element is EnumElement) {
      return EnumPatternMatchingCodeGenerator(element).generate();
    } else {
      throw InvalidGenerationSourceError(
        '''@steroids can only be applied on enum types. Instead, you are trying to use is it on a ${element.kind} ${element.name}.''',
        element: element,
      );
    }
  }
}
