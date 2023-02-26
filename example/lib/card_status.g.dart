// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_status.dart';

// **************************************************************************
// EnumWhenGenerator
// **************************************************************************

extension CardStatusPatternMatch on CardStatus {
  String get value => [
        'active',
        'issued',
        'blocked',
        'lost',
        'damaged',
        'cancelled',
        'stolen',
        'pending',
        'expired'
      ][index];
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
    return items[this]!();
  }

  T whenOrElse<T>({
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
    final f = items[this];
    return (f != null) ? f() : orElse();
  }
}
