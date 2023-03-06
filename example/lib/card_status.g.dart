// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_status.dart';

// **************************************************************************
// EnumWhenGenerator
// **************************************************************************

extension CardStatusStringExtension on String {
  CardStatus get getCardStatus => {
        "active": CardStatus.active,
        "issued": CardStatus.issued,
        "blocked": CardStatus.blocked,
        "lost": CardStatus.lost,
        "damaged": CardStatus.damaged,
        "cancelled": CardStatus.cancelled,
        "stolen": CardStatus.stolen,
        "pending": CardStatus.pending,
        "expired": CardStatus.expired,
      }[this]!;
}

extension CardStatusFromStringExtension on Iterable<CardStatus> {
  CardStatus? fromString(String value) {
    final item =
        value.replaceAll('CardStatus.', '').replaceAll('_', '').toLowerCase();
    return cast<CardStatus?>().firstWhere(
        (e) =>
            e
                .toString()
                .replaceAll('CardStatus.', '')
                .replaceAll('_', '')
                .toLowerCase() ==
            item,
        orElse: () => null);
  }
}

extension CardStatusExtension on CardStatus {
  bool get isActive => this == CardStatus.active;
  bool get isIssued => this == CardStatus.issued;
  bool get isBlocked => this == CardStatus.blocked;
  bool get isLost => this == CardStatus.lost;
  bool get isDamaged => this == CardStatus.damaged;
  bool get isCancelled => this == CardStatus.cancelled;
  bool get isStolen => this == CardStatus.stolen;
  bool get isPending => this == CardStatus.pending;
  bool get isExpired => this == CardStatus.expired;

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

  /// Use `when()` method when you want to perform some action based on the enum
  /// ```dart
  /// response.when(
  ///   active: () {
  //       Do some actions only if the response is CardStatus.active"
  ///   }
  ///   issued: () {
  //       Do some actions only if the response is CardStatus.issued"
  ///   }
  ///   blocked: () {
  //       Do some actions only if the response is CardStatus.blocked"
  ///   }
  ///   lost: () {
  //       Do some actions only if the response is CardStatus.lost"
  ///   }
  ///   damaged: () {
  //       Do some actions only if the response is CardStatus.damaged"
  ///   }
  ///   cancelled: () {
  //       Do some actions only if the response is CardStatus.cancelled"
  ///   }
  ///   stolen: () {
  //       Do some actions only if the response is CardStatus.stolen"
  ///   }
  ///   pending: () {
  //       Do some actions only if the response is CardStatus.pending"
  ///   }
  ///   expired: () {
  //       Do some actions only if the response is CardStatus.expired"
  ///   }
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

  void onlyWhen<T>({
    void Function()? active,
    void Function()? issued,
    void Function()? blocked,
    void Function()? lost,
    void Function()? damaged,
    void Function()? cancelled,
    void Function()? stolen,
    void Function()? pending,
    void Function()? expired,
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
    f?.call();
  }

  /// Use `mayBeWhen()` method when you want to perform some action based on the enum
  /// ```dart
  /// response.mayBeWhen(
  ///   active: () {
  //       Do some actions only if the response is CardStatus.active"
  ///   }
  ///   orElse: () {
  //       Do some actions only if the response is not found
  ///   }
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
    final f = items[this];
    return (f != null) ? f() : orElse();
  }

  /// Use `map()` method when you want to perform some action based on the enum
  /// ```dart
  /// response.map(
  ///   active: (e) {
  //       Do some actions only if the response is CardStatus.active"
  ///   }
  ///   issued: (e) {
  //       Do some actions only if the response is CardStatus.issued"
  ///   }
  ///   blocked: (e) {
  //       Do some actions only if the response is CardStatus.blocked"
  ///   }
  ///   lost: (e) {
  //       Do some actions only if the response is CardStatus.lost"
  ///   }
  ///   damaged: (e) {
  //       Do some actions only if the response is CardStatus.damaged"
  ///   }
  ///   cancelled: (e) {
  //       Do some actions only if the response is CardStatus.cancelled"
  ///   }
  ///   stolen: (e) {
  //       Do some actions only if the response is CardStatus.stolen"
  ///   }
  ///   pending: (e) {
  //       Do some actions only if the response is CardStatus.pending"
  ///   }
  ///   expired: (e) {
  //       Do some actions only if the response is CardStatus.expired"
  ///   }
  /// );
  /// ```
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
  }

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
  }
}
