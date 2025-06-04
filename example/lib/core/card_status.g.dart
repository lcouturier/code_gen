// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_status.dart';

// **************************************************************************
// EnumPatternMatchingGenerator
// **************************************************************************

extension ExtensionCardStatus on CardStatus {
  /// Whether this is equal to  CardStatus.active.
  bool get isActive => this == CardStatus.active;

  /// Whether this is equal to  CardStatus.issued.
  bool get isIssued => this == CardStatus.issued;

  /// Whether this is equal to  CardStatus.blocked.
  bool get isBlocked => this == CardStatus.blocked;

  /// Whether this is equal to  CardStatus.lost.
  bool get isLost => this == CardStatus.lost;

  /// Whether this is equal to  CardStatus.damaged.
  bool get isDamaged => this == CardStatus.damaged;

  /// Whether this is equal to  CardStatus.cancelled.
  bool get isCancelled => this == CardStatus.cancelled;

  /// Whether this is equal to  CardStatus.stolen.
  bool get isStolen => this == CardStatus.stolen;

  /// Whether this is equal to  CardStatus.pending.
  bool get isPending => this == CardStatus.pending;

  /// Whether this is equal to  CardStatus.expired.
  bool get isExpired => this == CardStatus.expired;
  static CardStatus fromName(String value) {
    return CardStatus.values.firstWhere(
      (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => throw ArgumentError("Invalid CardStatus value"),
    );
  }

  static CardStatus fromOrdinal(int value) {
    if (value < 0 || value >= CardStatus.values.length) {
      throw ArgumentError("Invalid CardStatus value");
    }
    return CardStatus.values[value];
  }

  /// Use when method when you want to perform some action based on the enum
  ///
  /// ```dart
  /// CardStatus value = CardStatus.active;
  /// final result = value.when(
  ///   active: () => 'active',
  ///   issued: () => 'issued',
  ///   blocked: () => 'blocked',
  ///   lost: () => 'lost',
  ///   damaged: () => 'damaged',
  ///   cancelled: () => 'cancelled',
  ///   stolen: () => 'stolen',
  ///   pending: () => 'pending',
  ///   expired: () => 'expired',
  /// );
  /// ```
  T when<T>({
    required T Function() active,
    required T Function() issued,
    required T Function() blocked,
    required T Function() lost,
    required T Function() damaged,
    required T Function() cancelled,
    required T Function() stolen,
    required T Function() pending,
    required T Function() expired,
  }) {
    return switch (this) {
      CardStatus.active => active(),
      CardStatus.issued => issued(),
      CardStatus.blocked => blocked(),
      CardStatus.lost => lost(),
      CardStatus.damaged => damaged(),
      CardStatus.cancelled => cancelled(),
      CardStatus.stolen => stolen(),
      CardStatus.pending => pending(),
      CardStatus.expired => expired(),
    };
  }

  /// Use map method when you want to perform some action based on the enum
  ///
  /// ```dart
  /// CardStatus value = CardStatus.active;
  /// final result = value.map(
  ///   active: (e) => e.toString(),
  ///   issued: (e) => e.toString(),
  ///   blocked: (e) => e.toString(),
  ///   lost: (e) => e.toString(),
  ///   damaged: (e) => e.toString(),
  ///   cancelled: (e) => e.toString(),
  ///   stolen: (e) => e.toString(),
  ///   pending: (e) => e.toString(),
  ///   expired: (e) => e.toString(),
  /// );
  /// ```
  T map<T>({
    required T Function(CardStatus) active,
    required T Function(CardStatus) issued,
    required T Function(CardStatus) blocked,
    required T Function(CardStatus) lost,
    required T Function(CardStatus) damaged,
    required T Function(CardStatus) cancelled,
    required T Function(CardStatus) stolen,
    required T Function(CardStatus) pending,
    required T Function(CardStatus) expired,
  }) {
    return switch (this) {
      CardStatus.active => active(this),
      CardStatus.issued => issued(this),
      CardStatus.blocked => blocked(this),
      CardStatus.lost => lost(this),
      CardStatus.damaged => damaged(this),
      CardStatus.cancelled => cancelled(this),
      CardStatus.stolen => stolen(this),
      CardStatus.pending => pending(this),
      CardStatus.expired => expired(this),
    };
  }

  /// Use mayBeWhen method when you want to perform some action based on the enum
  ///
  /// Throws an [ArgumentError] if all parameters are null
  /// ```dart
  /// CardStatus value = CardStatus.active;
  /// final result = value.mayBeWhen(
  ///   active: () => 'active',
  ///   orElse: () => 'default'
  /// );
  /// ```
  T mayBeWhen<T>({
    T Function()? active,
    T Function()? issued,
    T Function()? blocked,
    T Function()? lost,
    T Function()? damaged,
    T Function()? cancelled,
    T Function()? stolen,
    T Function()? pending,
    T Function()? expired,
    required T Function() orElse,
  }) {
    final items = {
      CardStatus.active: active,
      CardStatus.issued: issued,
      CardStatus.blocked: blocked,
      CardStatus.lost: lost,
      CardStatus.damaged: damaged,
      CardStatus.cancelled: cancelled,
      CardStatus.stolen: stolen,
      CardStatus.pending: pending,
      CardStatus.expired: expired,
    };
    return items[this]?.call() ?? orElse();
  }

  /// Use mayBeMap method when you want to perform some action based on the enum
  ///
  /// Throws an [ArgumentError] if all parameters are null
  /// ```dart
  /// CardStatus value = CardStatus.active;
  /// final result = value.mayBeMap(
  ///   active: (e) => e.toString(),
  ///   orElse: () => 'default'
  /// );
  /// ```
  T mayBeMap<T>({
    T Function(CardStatus)? active,
    T Function(CardStatus)? issued,
    T Function(CardStatus)? blocked,
    T Function(CardStatus)? lost,
    T Function(CardStatus)? damaged,
    T Function(CardStatus)? cancelled,
    T Function(CardStatus)? stolen,
    T Function(CardStatus)? pending,
    T Function(CardStatus)? expired,
    required T Function() orElse,
  }) {
    final items = {
      CardStatus.active: active,
      CardStatus.issued: issued,
      CardStatus.blocked: blocked,
      CardStatus.lost: lost,
      CardStatus.damaged: damaged,
      CardStatus.cancelled: cancelled,
      CardStatus.stolen: stolen,
      CardStatus.pending: pending,
      CardStatus.expired: expired,
    };
    return items[this]?.call(this) ?? orElse();
  }
}
