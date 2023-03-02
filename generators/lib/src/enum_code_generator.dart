// ignore_for_file: depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:source_gen/source_gen.dart';

enum MethodType {
  when("when", false, false),
  onlyWhen("onlyWhen", false, false),
  mayBeWhen("mayBeWhen", false, true),
  map("map", true, false),
  maybeMap("mayBeMap", true, true);

  const MethodType(this.label, this.isMapMethod, this.isMayBe);
  final String label;
  final bool isMapMethod;
  final bool isMayBe;
}

class EnumCodeGenerator {
  final EnumElement element;
  final _generated = StringBuffer();
  late List<FieldElement> fields;

  EnumCodeGenerator(this.element) : assert(element.kind == ElementKind.ENUM) {
    fields = element.fields.where((e) => e.isEnumConstant).toList();
  }

  SteroidsEnum _getAnnotation() {
    final annotation = const TypeChecker.fromRuntime(SteroidsEnum).firstAnnotationOf(element);
    if (annotation != null) {
      final reader = ConstantReader(annotation);
      final hasChecker = reader.read('hasChecker').literalValue as bool?;
      final hasWhen = reader.read('hasWhen').literalValue as bool?;
      final hasMap = reader.read('hasMap').literalValue as bool?;
      final hasMaybeWhen = reader.read('hasMaybeWhen').literalValue as bool?;
      final hasMaybeMap = reader.read('hasMaybeMap').literalValue as bool?;
      final hasOnlyWhen = reader.read('hasOnlyWhen').literalValue as bool?;

      return SteroidsEnum(
        hasChecker: hasChecker ?? true,
        hasWhen: hasWhen ?? true,
        hasMap: hasMap ?? true,
        hasMaybeWhen: hasMaybeWhen ?? true,
        hasMaybeMap: hasMaybeMap ?? true,
        hasOnlyWhen: hasOnlyWhen ?? true,
      );
    }
    return const SteroidsEnum();
  }

  String generate() {
    final annotation = _getAnnotation();
    _generateExtensionHeader();
    if (annotation.hasChecker) {
      _generateProperties();
    }
    _generateMethods(annotation);
    _generateExtensionBottom();
    return _generated.toString();
  }

  void _generateExtensionBottom() => _generated.writeln('}');

  void _generateExtensionHeader() {
    _generated.writeln('extension ${element.name}Extension on ${element.name}{');
  }

  void _generateProperties() {
    final items = fields.map((e) {
      var name = e.name.replaceRange(0, 1, e.name[0].toUpperCase());
      return 'bool get is$name => this == ${element.name}.${e.name};';
    });
    for (var e in items) {
      _generated.writeln(e);
    }
    _generated.writeln();
    final values = fields.map((e) => "'${e.name}'").join(", ");
    _generated.writeln('String get value => [$values][index];');
    _generated.writeln();
  }

  void _generateMethods(SteroidsEnum annotation) {
    if (annotation.hasWhen) {
      _when();
    }
    if (annotation.hasOnlyWhen) {
      _onlyWhen();
    }
    if (annotation.hasMaybeWhen) {
      _mayBeWhen();
    }
    if (annotation.hasMap) {
      _map();
    }
    if (annotation.hasMaybeMap) {
      _mayBeMap();
    }
  }

  void _generateDictionary() {
    _generated.writeln('     final items = {');
    for (var f in fields.map((e) => e.name)) {
      _generated.writeln('${element.name}.$f  : $f,');
    }
    _generated.writeln('     };');
  }

  void _generateMapParameters(bool isNullable) {
    for (var f in fields.map((e) => e.name)) {
      _generated
          .writeln('  ${isNullable ? "" : "required"} T Function(${element.name} $f)${isNullable ? "?" : ""} $f,');
    }
  }

  void _generateWhenParameters(bool isNullable) {
    for (var f in fields.map((e) => e.name)) {
      _generated.writeln('  ${isNullable ? "" : "required"} T Function()${isNullable ? "?" : ""} $f,');
    }
  }

  void _generateOnlyWhenParameters() {
    for (var f in fields.map((e) => e.name)) {
      _generated.writeln('  void Function()? $f,');
    }
  }

  void _generateOnlyWhenReturn() {
    _generated.writeln('     final f = items[this];');
    _generated.writeln('     f?.call();');
    _generated.writeln('  }');
  }

  void _generateMayBeWhenReturn() {
    _generated.writeln('     final f = items[this];');
    _generated.writeln('     return (f != null) ? f() : orElse();');
    _generated.writeln('  }');
  }

  void _generateMayBeMapReturn() {
    _generated.writeln('     final f = items[this];');
    _generated.writeln('     return (f != null) ? f(this) : orElse();');
    _generated.writeln('  }');
  }

  void _generateMapReturn() {
    _generated.writeln('     return items[this]!(this);');
    _generated.writeln('  }');
  }

  void _generateWhenReturn() {
    _generated.writeln('     return items[this]!();');
    _generated.writeln('  }');
  }

  void _generateComment(MethodType methodType) {
    _generated.writeln('/// Use `${methodType.label}()` method when you want to perform some action based on the enum');
    _generated.writeln('/// ```dart');
    _generated.writeln('/// response.${methodType.label}(');
    for (var name in fields.map((e) => e.name).take(methodType.isMayBe ? 1 : fields.length)) {
      _generated.writeln('///   $name: ${methodType.isMapMethod ? "(e)" : "()"} {');
      _generated.writeln('  //       Do some actions only if the response is ${element.name}.$name"');
      _generated.writeln('///   }');
    }
    if (methodType.isMayBe) {
      _generated.writeln('///   orElse: () {');
      _generated.writeln('  //       Do some actions only if the response is not found');
      _generated.writeln('///   }');
    }
    _generated.writeln('/// );');
    _generated.writeln('/// ```');
  }

  void _map() {
    _generated.writeln();
    _generateComment(MethodType.map);
    _generated.writeln('T map<T>({');
    _generateMapParameters(false);
    _generated.writeln('}) {');
    _generateDictionary();
    _generateMapReturn();
  }

  void _when() {
    _generated.writeln();
    _generateComment(MethodType.when);
    _generated.writeln('T when<T>({');
    _generateWhenParameters(false);
    _generated.writeln('}) {');
    _generateDictionary();
    _generateWhenReturn();
  }

  void _onlyWhen() {
    _generated.writeln();
    _generated.writeln('void onlyWhen<T>({');
    _generateOnlyWhenParameters();
    _generated.writeln('}) {');
    _generateDictionary();
    _generateOnlyWhenReturn();
  }

  void _mayBeWhen() {
    _generated.writeln();
    _generateComment(MethodType.mayBeWhen);
    _generated.writeln('T mayBeWhen<T>({');
    _generateWhenParameters(true);
    _generated.writeln('  required T Function() orElse,');
    _generated.writeln('}) {');
    _generateDictionary();
    _generateMayBeWhenReturn();
  }

  void _mayBeMap() {
    _generated.writeln();
    _generated.writeln('T mayBeMap<T>({');
    _generateMapParameters(true);
    _generated.writeln('  required T Function() orElse,');
    _generated.writeln('}) {');
    _generateDictionary();
    _generateMayBeMapReturn();
  }
}
