// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';
import 'package:generators/src/enum_pattern_matching_generator.dart';
import 'package:generators/src/unit_test_generator.dart';
import 'package:analyzer/src/dart/element/element.dart'; // For EnumElementImpl
import 'package:analyzer/src/dart/element/type.dart'; // For InterfaceTypeImpl

// A basic mock for FieldElement
class MockFieldElement extends FieldElementImpl {
  MockFieldElement(String name, int nameOffset) : super(name, nameOffset);

  @override
  bool get isEnumConstant => true;
}

// A basic mock for EnumElement
class MockEnumElement extends EnumElementImpl {
  final List<FieldElement> _fields;

  MockEnumElement(String name, int nameOffset, List<String> fieldNames)
      : _fields = fieldNames
            .map((fn) => MockFieldElement(fn, 0)
              ..enclosingElement = EnumElementImpl(name, 0) // Self-reference for enclosing element
              ..type = InterfaceTypeImpl(name: name, element: EnumElementImpl(name,0), typeArguments: const []) // Mock type
            )
            .toList(),
        super(name, nameOffset);

  @override
  List<FieldElement> get fields => _fields;

  @override
  InterfaceType get type => InterfaceTypeImpl(name: name, element: this, typeArguments: const []);

  // Mocking library property if it's accessed by the generator
  @override
  LibraryElement get library => MockLibraryElement();
}

class MockLibraryElement extends LibraryElementImpl {
  MockLibraryElement() : super(null, '', 0, 0, 0); // Adjust params as needed

  @override
  String get identifier => 'mock_library';
}


void main() {
  group('EnumPatternMatchingGenerator', () {
    final generator = EnumPatternMatchingGenerator();
    // TODO: Annotation options testing will require more setup for ConstantReader

    test('generates extension for a simple enum', () {
      final enumElement = MockEnumElement('MyEnum', 0, ['valueA', 'valueB']);
      final generatedCode = generator.generateForAnnotatedElement(
        enumElement,
        ConstantReader(null), // TODO: Mock ConstantReader for annotation options
        BuildStepMock(), // This is a placeholder
      );

      // Basic checks
      expect(generatedCode, isNotNull);
      expect(generatedCode, isNotEmpty);
      expect(generatedCode, contains('extension MyEnumExtension on MyEnum'));
      expect(generatedCode, contains('when<R>({'));
      expect(generatedCode, contains('R Function() valueA,'));
      expect(generatedCode, contains('R Function() valueB,'));
      expect(generatedCode, contains('map<R>({'));
      expect(generatedCode, contains('R Function(MyEnum e) valueA,'));
      expect(generatedCode, contains('R Function(MyEnum e) valueB,'));
      expect(generatedCode, contains('bool get isValueA => this == MyEnum.valueA;'));
      expect(generatedCode, contains('bool get isValueB => this == MyEnum.valueB;'));
      expect(generatedCode, contains('static MyEnum fromName(String name)'));
      expect(generatedCode, contains("case 'valueA': return MyEnum.valueA;"));
      expect(generatedCode, contains("case 'valueb': return MyEnum.valueB;")); // Note: toLowerCase in generator
      expect(generatedCode, contains('static MyEnum fromOrdinal(int ordinal)'));
      expect(generatedCode, contains("case 0: return MyEnum.valueA;"));
      expect(generatedCode, contains("case 1: return MyEnum.valueB;"));
    });
  });

  group('UnitTestGenerator', () {
    final generator = UnitTestGenerator();

    // Mock BuildStep
    final buildStepMock = BuildStepMock();

    test('generates tests for a simple enum', () async {
      final enumElement = MockEnumElement('MyEnum', 0, ['valueA', 'valueB']);
      // UnitTestGenerator expects a LibraryReader
      // We'll have to simulate this or use source_gen_test later
      // For now, let's adapt the test if possible or keep it simple

      final libraryReader = LibraryReaderMock([enumElement]);
      final generatedCode = await generator.generate(libraryReader, buildStepMock);

      // Basic checks
      expect(generatedCode, isNotNull);
      expect(generatedCode, isNotEmpty);
      expect(generatedCode, contains("import 'package:test/test.dart';"));
      // expect(generatedCode, contains("import 'my_enum.dart';")); // This needs buildStep.inputId setup
      expect(generatedCode, contains('group(\'MyEnum\', () {'));
      expect(generatedCode, contains("test(''when' for valueA', () {"));
      expect(generatedCode, contains("test(''map' for valueA', () {"));
      expect(generatedCode, contains("test(''maybeWhen' for valueA (matching case)', () {"));
      expect(generatedCode, contains("test(''maybeMap' for valueA (matching case)', () {"));
      expect(generatedCode, contains("test(''isValueA' for valueA', () {"));
      expect(generatedCode, contains("expect(MyEnum.valueA.isValueA, true);"));
      expect(generatedCode, contains("test(''fromName' for 'valueA'', () {"));
      expect(generatedCode, contains("expect(MyEnum.fromName('valueA'), MyEnum.valueA);"));
      expect(generatedCode, contains("test(''fromName' with invalid name throws ArgumentError', () {"));
      expect(generatedCode, contains("test(''fromOrdinal' for ordinal 0 returns valueA', () {"));
      expect(generatedCode, contains("expect(MyEnum.fromOrdinal(0), MyEnum.valueA);"));
      expect(generatedCode, contains("test(''fromOrdinal' with -1 throws ArgumentError', () {"));
    });

    test('generates empty string for no enums', () async {
      final libraryReader = LibraryReaderMock([]); // No enums
      final generatedCode = await generator.generate(libraryReader, buildStepMock);
      expect(generatedCode, isEmpty);
    });
  });
}

// --- Mocks ---
// More sophisticated mocking might be needed for full coverage.
// Consider using the `mocktail` package or `source_gen_test` for robust tests.

class BuildStepMock implements BuildStep {
  @override
  final AssetId inputId = AssetId('my_package', 'lib/my_enum.dart'); // Mock inputId

  // Implement other BuildStep methods as needed, or leave them to throw UnimplementedError
  // if they are not called by the generator under test.
  @override
  Future<bool> canRead(AssetId id) => throw UnimplementedError();
  @override
  Future<T> trackStage<T>(String label, Future<T> Function() action, {bool isExternal = false}) => throw UnimplementedError();
  @override
  Future<void> writeAsBytes(AssetId id, Future<List<int>> bytes) => throw UnimplementedError();
  @override
  Future<void> writeAsString(AssetId id, Future<String> contents, {Encoding encoding = utf8}) => throw UnimplementedError();
  @override
  Stream<List<int>> readAsBytes(AssetId id) => throw UnimplementedError();
  @override
  Future<String> readAsString(AssetId id, {Encoding encoding = utf8}) => throw UnimplementedError();
  @override
  Resolver get resolver => throw UnimplementedError();
  @override
  AssetReader get reader => throw UnimplementedError();
  @override
  AssetWriter get writer => throw UnimplementedError();
  @override
  Future<LibraryElement> get inputLibrary async => MockLibraryElementWithEnums([]); // Empty for now
  @override
  Set<AssetId> get expectedOutputs => throw UnimplementedError();
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class LibraryReaderMock implements LibraryReader {
  final List<EnumElement> _enums;

  LibraryReaderMock(this._enums);

  @override
  Iterable<EnumElement> get enums => _enums;

  // Implement other LibraryReader methods if needed
  @override
  Iterable<ClassElement> get classes => throw UnimplementedError();
  @override
  Iterable<ConstantReader> get constants => throw UnimplementedError();
  @override
  Iterable<Element> get elements => throw UnimplementedError();
  @override
  Iterable<ExtensionElement> get extensions => throw UnimplementedError();
  @override
  Iterable<MixinElement> get mixins => throw UnimplementedError();
  @override
  Iterable<TopLevelVariableElement> get topLevelVariables => throw UnimplementedError();
  @override
  Iterable<TypeAliasElement> get typeAliases => throw UnimplementedError();
  @override
  Element get element => throw UnimplementedError();
  @override
  Revivable revive() => throw UnimplementedError();
  @override
  Iterable<T> annotatedWith<T>(TypeChecker checker, {bool throwOnUnresolved}) => throw UnimplementedError();
  @override
  Iterable<AnnotatedElement> findAnnotatedElements(TypeChecker checker, {bool throwOnUnresolved = true}) => throw UnimplementedError();
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class MockLibraryElementWithEnums extends MockLibraryElement {
  final List<EnumElement> enumsToReturn;
  MockLibraryElementWithEnums(this.enumsToReturn);

  @override
  List<CompilationUnitElement> get units {
    // This is a very simplified mock. A real LibraryElement would have units
    // that contain the enums.
    final unit = CompilationUnitElementImpl(null, '', 0); // Mock unit
    // How enums are linked to units might be more complex.
    // For now, this is a placeholder.
    return [unit];
  }
}

// Helper to create a simple EnumElement for testing (very basic)
// Consider using package:analyzer/dart/analysis/utilities.dart to parse real code for more robust elements.
// Or use source_gen_test.
EnumElementImpl _createEnumElement(String name, List<String> valueNames) {
  final enumElement = EnumElementImpl(name, 0);
  final fields = valueNames.map((vn) {
    final field = FieldElementImpl(vn, 0);
    field.enclosingElement = enumElement;
    // field.type = enumElement.type; // This creates a circular dependency if not careful
    return field;
  }).toList();
  // How fields are actually associated might be different.
  // This is a simplified assignment for the mock.
  // enumElement.fields = fields; // This property doesn't have a public setter.
  // Accessing fields on EnumElementImpl usually goes through computeNode or similar.
  // This basic mock might not be sufficient for complex scenarios.
  return enumElement;
}
