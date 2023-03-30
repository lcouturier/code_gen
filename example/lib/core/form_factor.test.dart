// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// UnnitTestGenerator
// **************************************************************************

void main() {
  test('when', () {
    final value = FormFactor.plastic;
    final result = value.when(
      plastic: () => 'plastic',
      virtual: () => 'virtual',
    );
    expect(result, "plastic");
  });

  test('map', () {
    final value = FormFactor.plastic;
    final result = value.map(
      plastic: (e) => e.toString(),
      virtual: (e) => e.toString(),
    );
    expect(result, "plastic");
  });

  test('mayBeWhen', () {
    final value = FormFactor.plastic;
    final result =
        value.when(plastic: () => 'plastic', orElse: () => 'default');
    expect(result, "plastic");
  });

  test('mayBeMap', () {
    final value = FormFactor.plastic;
    final result =
        value.map(plastic: (e) => e.toString(), orElse: () => 'default');
    expect(result, "plastic");
  });
}
