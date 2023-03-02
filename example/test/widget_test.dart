// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:example/form_factor.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('fromString 1', () {
    final result = FormFactor.values.fromString("Virtual");
    expect(result, FormFactor.virtual);
  });
  test('fromString 2', () {
    final result = FormFactor.values.fromString("Virt");
    expect(result, null);
  });
  test('when 1', () {
    FormFactor value = FormFactor.virtual;
    final result = value.when(plastic: () => 'plastic', virtual: () => 'virtual');
    expect(result, 'virtual');
  });

  test('map 1', () {
    FormFactor value = FormFactor.virtual;
    final result = value.map(plastic: (e) => e.toString(), virtual: (e) => e.toString());
    expect(result, 'FormFactor.virtual');
  });

  test('mayBeWhen 1', () {
    FormFactor value = FormFactor.plastic;
    final result = value.mayBeWhen(plastic: () => 'plastic', orElse: () => "default");
    expect(result, 'plastic');
  });

  test('mayBeMap 1', () {
    FormFactor value = FormFactor.plastic;
    final result = value.mayBeMap(plastic: (e) => e.toString(), orElse: () => "default");
    expect(result, 'FormFactor.plastic');
  });

  test('mayBeWhen 2', () {
    FormFactor value = FormFactor.virtual;
    final result = value.mayBeWhen(plastic: () => 'plastic', orElse: () => "default");
    expect(result, 'default');
  });
}
