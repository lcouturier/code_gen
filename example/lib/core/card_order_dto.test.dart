// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// UnnitTestGenerator
// **************************************************************************

import 'package:example/core/card_order_dto.dart';

void main(List args) {
  test('when', () {
    const value = State.enabled;
    final result = value.when(
      enabled: () => 'enabled',
      disabled: () => 'disabled',
    );
    expect(result, "enabled");
  });

  test('map', () {
    const value = State.enabled;
    final result = value.map(
      enabled: (e) => e.toString(),
      disabled: (e) => e.toString(),
    );
    expect(result, "enabled");
  });

  test('mayBeWhen', () {
    const value = State.enabled;
    final result = value.when(enabled: () => 'enabled', orElse: () => 'default');
    expect(result, "enabled");
  });

  test('mayBeMap', () {
    const value = State.enabled;
    final result = value.map(enabled: (e) => e.toString(), orElse: () => 'default');
    expect(result, "enabled");
  });
}