// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// UnnitTestGenerator
// **************************************************************************

void main() {
  test('when', () {
    final value = CardStatus.active;
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
    final value = CardStatus.active;
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
    final value = CardStatus.active;
    final result = value.when(active: () => 'active', orElse: () => 'default');
    expect(result, "active");
  });

  test('mayBeMap', () {
    final value = CardStatus.active;
    final result =
        value.map(active: (e) => e.toString(), orElse: () => 'default');
    expect(result, "active");
  });
}
