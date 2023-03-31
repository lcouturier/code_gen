// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// UnnitTestGenerator
// **************************************************************************

import 'package:example/core/purpose.dart';

void main(List args) {
  test('when', () {
    const value = Purpose.loadTransaction;
    final result = value.when(
      loadTransaction: () => 'loadTransaction',
      successfulTransaction: () => 'successfulTransaction',
      declinedTransaction: () => 'declinedTransaction',
      marketingCommunication: () => 'marketingCommunication',
    );
    expect(result, "loadTransaction");
  });

  test('map', () {
    const value = Purpose.loadTransaction;
    final result = value.map(
      loadTransaction: (e) => e.toString(),
      successfulTransaction: (e) => e.toString(),
      declinedTransaction: (e) => e.toString(),
      marketingCommunication: (e) => e.toString(),
    );
    expect(result, "loadTransaction");
  });

  test('mayBeWhen', () {
    const value = Purpose.loadTransaction;
    final result = value.when(loadTransaction: () => 'loadTransaction', orElse: () => 'default');
    expect(result, "loadTransaction");
  });

  test('mayBeMap', () {
    const value = Purpose.loadTransaction;
    final result = value.map(loadTransaction: (e) => e.toString(), orElse: () => 'default');
    expect(result, "loadTransaction");
  });
}
