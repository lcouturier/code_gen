// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_status.dart';

// **************************************************************************
// EnumWhenGenerator
// **************************************************************************

extension CardStatusPatternMatch on CardStatus {
  T map<T>({
    required T Function(CardStatus active) active,
    required T Function(CardStatus issued) issued,
    required T Function(CardStatus blocked) blocked,
    required T Function(CardStatus lost) lost,
    required T Function(CardStatus damaged) damaged,
    required T Function(CardStatus cancelled) cancelled,
    required T Function(CardStatus stolen) stolen,
    required T Function(CardStatus pending) pending,
    required T Function(CardStatus expired) expired,
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
    return items[this]!(this);
  } // _map

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
  } // _when

  T mayBeMap<T>({
    T Function(CardStatus active)? active,
    T Function(CardStatus issued)? issued,
    T Function(CardStatus blocked)? blocked,
    T Function(CardStatus lost)? lost,
    T Function(CardStatus damaged)? damaged,
    T Function(CardStatus cancelled)? cancelled,
    T Function(CardStatus stolen)? stolen,
    T Function(CardStatus pending)? pending,
    T Function(CardStatus expired)? expired,
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
    return (f != null) ? f(this) : orElse();
  } // _mayBeMap

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
    final f = items[this];
    return (f != null) ? f() : orElse();
  } // _mayBeWhen
} // CardStatusPatternMatch
