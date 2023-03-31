// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// UnnitTestGenerator
// **************************************************************************

import 'package:example/core/form_factor.dart';

void main(List args) {
  test('when', () {
    const value = FormFactor.plastic;
    final result = value.when(
      plastic: () => 'plastic',
      virtual: () => 'virtual',
    );
    expect(result, "plastic");
  });

  test('map', () {
    const value = FormFactor.plastic;
    final result = value.map(
      plastic: (e) => e.toString(),
      virtual: (e) => e.toString(),
    );
    expect(result, "plastic");
  });

  test('mayBeWhen', () {
    const value = FormFactor.plastic;
    final result = value.when(plastic: () => 'plastic', orElse: () => 'default');
    expect(result, "plastic");
  });

  test('mayBeMap', () {
    const value = FormFactor.plastic;
    final result = value.map(plastic: (e) => e.toString(), orElse: () => 'default');
    expect(result, "plastic");
  });
}
