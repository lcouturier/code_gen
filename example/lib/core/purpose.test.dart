// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// UnnitTestGenerator
// **************************************************************************

void main() {
  test('when', () {
    final value = Purpose.loadTransaction;
    final result = value.when(
      loadTransaction: () => 'loadTransaction',
      successfulTransaction: () => 'successfulTransaction',
      declinedTransaction: () => 'declinedTransaction',
      marketingCommunication: () => 'marketingCommunication',
    );
    expect(result, "loadTransaction");
  });

  test('map', () {
    final value = Purpose.loadTransaction;
    final result = value.map(
      loadTransaction: (e) => e.toString(),
      successfulTransaction: (e) => e.toString(),
      declinedTransaction: (e) => e.toString(),
      marketingCommunication: (e) => e.toString(),
    );
    expect(result, "loadTransaction");
  });

  test('mayBeWhen', () {
    final value = Purpose.loadTransaction;
    final result = value.when(
        loadTransaction: () => 'loadTransaction', orElse: () => 'default');
    expect(result, "loadTransaction");
  });

  test('mayBeMap', () {
    final value = Purpose.loadTransaction;
    final result = value.map(
        loadTransaction: (e) => e.toString(), orElse: () => 'default');
    expect(result, "loadTransaction");
  });
}
