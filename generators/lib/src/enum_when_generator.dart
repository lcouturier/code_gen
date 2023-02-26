// ignore_for_file: depend_on_referenced_packages, implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:generators/src/enum_visitor.dart';
import 'package:source_gen/source_gen.dart';

class EnumWhenGenerator extends GeneratorForAnnotation<EnumWhenAnnotation> {
  @override
  String generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    final visitor = EnumVisitor();
    element.visitChildren(visitor);

    final buffer = StringBuffer();
    buffer.writeln('extension ${visitor.className}PatternMatch on ${visitor.className} {');

    buffer.writeln('T when<T>({');
    for (var f in visitor.fields.entries.map((e) => e.key)) {
      buffer.writeln('  required T Function() $f,');
    }
    buffer.writeln('}) {');
    buffer.writeln('     final items = {');
    for (var f in visitor.fields.entries.map((e) => e.key)) {
      buffer.writeln('${visitor.className}.$f  : $f,');
    }
    buffer.writeln('     };');
    buffer.writeln('     return items[this]!();');
    buffer.writeln('   }');

    buffer.writeln('T whenOrElse<T>({');
    for (var f in visitor.fields.entries.map((e) => e.key)) {
      buffer.writeln('  T Function()? $f,');
    }
    buffer.writeln('  required T Function() orElse,');
    buffer.writeln('}) {');
    buffer.writeln('     final items = {');
    for (var f in visitor.fields.entries.map((e) => e.key)) {
      buffer.writeln('${visitor.className}.$f  : $f,');
    }
    buffer.writeln('     };');
    buffer.writeln('     final f = items[this];');
    buffer.writeln('     return (f != null) ? f() : orElse();');
    buffer.writeln('  }');
    buffer.writeln('}');
    return buffer.toString();
  }
}
