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

    _map(buffer, visitor);
    _when(buffer, visitor);
    _mayBeMap(buffer, visitor);
    _mayBeWhen(buffer, visitor);

    buffer.writeln('} // ${visitor.className}PatternMatch');
    return buffer.toString();
  }

  void _map(StringBuffer buffer, EnumVisitor visitor) {
    buffer.writeln('T map<T>({');
    for (var f in visitor.fields.entries.map((e) => e.key)) {
      buffer.writeln('required T Function(${visitor.className} $f) $f,');
    }
    buffer.writeln('}) {');
    buffer.writeln('     final items = {');
    for (var f in visitor.fields.entries.map((e) => e.key)) {
      buffer.writeln('${visitor.className}.$f  : $f,');
    }
    buffer.writeln('     };');
    buffer.writeln('     return items[this]!(this);');
    buffer.writeln('   } // _map');
  }

  void _when(StringBuffer buffer, EnumVisitor visitor) {
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
    buffer.writeln('   } // _when');
  }

  void _mayBeWhen(StringBuffer buffer, EnumVisitor visitor) {
    buffer.writeln('T mayBeWhen<T>({');
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
    buffer.writeln('  } // _mayBeWhen');
  }

  void _mayBeMap(StringBuffer buffer, EnumVisitor visitor) {
    buffer.writeln('T mayBeMap<T>({');
    for (var f in visitor.fields.entries.map((e) => e.key)) {
      buffer.writeln('  T Function(${visitor.className} $f)? $f,');
    }
    buffer.writeln('  required T Function() orElse,');
    buffer.writeln('}) {');
    buffer.writeln('     final items = {');
    for (var f in visitor.fields.entries.map((e) => e.key)) {
      buffer.writeln('${visitor.className}.$f  : $f,');
    }
    buffer.writeln('     };');
    buffer.writeln('     final f = items[this];');
    buffer.writeln('     return (f != null) ? f(this) : orElse();');
    buffer.writeln('  } // _mayBeMap');
  }
}
