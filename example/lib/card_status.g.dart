// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_status.dart';

// **************************************************************************
// EnumWhenGenerator
// **************************************************************************

extension ExtensionCardStatus on CardStatus {
  bool get isActive => this == CardStatus.active;
  bool get isIssued => this == CardStatus.issued;
  bool get isBlocked => this == CardStatus.blocked;
  bool get isLost => this == CardStatus.lost;
  bool get isDamaged => this == CardStatus.damaged;
  bool get isCancelled => this == CardStatus.cancelled;
  bool get isStolen => this == CardStatus.stolen;
  bool get isPending => this == CardStatus.pending;
  bool get isExpired => this == CardStatus.expired;
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
    switch (this) {
      case CardStatus.active:
        return active();
      case CardStatus.issued:
        return issued();
      case CardStatus.blocked:
        return blocked();
      case CardStatus.lost:
        return lost();
      case CardStatus.damaged:
        return damaged();
      case CardStatus.cancelled:
        return cancelled();
      case CardStatus.stolen:
        return stolen();
      case CardStatus.pending:
        return pending();
      case CardStatus.expired:
        return expired();
    }
  }

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
    switch (this) {
      case CardStatus.active:
        return active(this);
      case CardStatus.issued:
        return issued(this);
      case CardStatus.blocked:
        return blocked(this);
      case CardStatus.lost:
        return lost(this);
      case CardStatus.damaged:
        return damaged(this);
      case CardStatus.cancelled:
        return cancelled(this);
      case CardStatus.stolen:
        return stolen(this);
      case CardStatus.pending:
        return pending(this);
      case CardStatus.expired:
        return expired(this);
    }
  }

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
    assert(() {
      if (active == null &&
          issued == null &&
          blocked == null &&
          lost == null &&
          damaged == null &&
          cancelled == null &&
          stolen == null &&
          pending == null &&
          expired == null) {
        throw 'check for at least one case';
      }
      return true;
    }());
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
    assert(() {
      if (active == null &&
          issued == null &&
          blocked == null &&
          lost == null &&
          damaged == null &&
          cancelled == null &&
          stolen == null &&
          pending == null &&
          expired == null) {
        throw 'check for at least one case';
      }
      return true;
    }());
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
  }
}
