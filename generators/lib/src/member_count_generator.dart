// Copyright (c) 2018, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:build/src/builder/build_step.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:source_gen/source_gen.dart';

class MemberCountLibraryGenerator extends Generator {
  @override
  String generate(LibraryReader library, BuildStep buildStep) {
    final enumElements = library.enums.toList();

    for (final element in enumElements) {
      final main = Method((c) {
        c
          ..name = 'main'
          ..returns = refer('void')
          ..body = Code("test('$element 1', () { });");
        //for (final method in element.methods) {
        //c.body = Code("test('$method 1', () { });");
        // c.methods.add(
        //   Method(
        //     (m) => m
        //       ..name = '${method.name}Test'
        //       ..returns = refer('void')
        //       ..body = const Code(''),
        //   ),
        // );
        //}
        // c.build();
      });
      final emitter = DartEmitter();
      return DartFormatter().format('${main.accept(emitter)}');
    }
    return '';
  }
}
