// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// UnnitTestGenerator
// **************************************************************************

import 'package:example/core/card_status.dart';

void main() {
  test('when', () {
    const value = CardStatus.active;
    final result = value.when(
      active: () => 'active',
      issued: () => 'issued',
      blocked: () => 'blocked',
      lost: () => 'lost',
      damaged: () => 'damaged',
      cancelled: () => 'cancelled',
      stolen: () => 'stolen',
      pending: () => 'pending',
      expired: () => 'expired',
    );
    expect(result, "active");
  });

  test('map', () {
    const value = CardStatus.active;
    final result = value.map(
      active: (e) => e.toString(),
      issued: (e) => e.toString(),
      blocked: (e) => e.toString(),
      lost: (e) => e.toString(),
      damaged: (e) => e.toString(),
      cancelled: (e) => e.toString(),
      stolen: (e) => e.toString(),
      pending: (e) => e.toString(),
      expired: (e) => e.toString(),
    );
    expect(result, "active");
  });

  test('mayBeWhen', () {
    const value = CardStatus.active;
    final result = value.when(active: () => 'active', orElse: () => 'default');
    expect(result, "active");
  });

  test('mayBeMap', () {
    const value = CardStatus.active;
    final result = value.map(active: (e) => e.toString(), orElse: () => 'default');
    expect(result, "active");
  });
}
