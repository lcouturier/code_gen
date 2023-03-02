// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purpose.dart';

// **************************************************************************
// EnumWhenGenerator
// **************************************************************************

extension PurposeExtension on Purpose {
  bool get isLoadTransaction => this == Purpose.loadTransaction;
  bool get isSuccessfulTransaction => this == Purpose.successfulTransaction;
  bool get isDeclinedTransaction => this == Purpose.declinedTransaction;
  bool get isMarketingCommunication => this == Purpose.marketingCommunication;

  String get value => [
        'loadTransaction',
        'successfulTransaction',
        'declinedTransaction',
        'marketingCommunication'
      ][index];

  /// Use `when()` method when you want to perform some action based on the enum
  /// ```dart
  /// response.when(
  ///   loadTransaction: () {
  //       Do some actions only if the response is Purpose.loadTransaction"
  ///   }
  ///   successfulTransaction: () {
  //       Do some actions only if the response is Purpose.successfulTransaction"
  ///   }
  ///   declinedTransaction: () {
  //       Do some actions only if the response is Purpose.declinedTransaction"
  ///   }
  ///   marketingCommunication: () {
  //       Do some actions only if the response is Purpose.marketingCommunication"
  ///   }
  /// );
  /// ```
  T when<T>({
    required T Function() loadTransaction,
    required T Function() successfulTransaction,
    required T Function() declinedTransaction,
    required T Function() marketingCommunication,
  }) {
    final items = {
      Purpose.loadTransaction: loadTransaction,
      Purpose.successfulTransaction: successfulTransaction,
      Purpose.declinedTransaction: declinedTransaction,
      Purpose.marketingCommunication: marketingCommunication,
    };
    return items[this]!();
  }

  void onlyWhen<T>({
    void Function()? loadTransaction,
    void Function()? successfulTransaction,
    void Function()? declinedTransaction,
    void Function()? marketingCommunication,
  }) {
    final items = {
      Purpose.loadTransaction: loadTransaction,
      Purpose.successfulTransaction: successfulTransaction,
      Purpose.declinedTransaction: declinedTransaction,
      Purpose.marketingCommunication: marketingCommunication,
    };
    final f = items[this];
    f?.call();
  }

  /// Use `mayBeWhen()` method when you want to perform some action based on the enum
  /// ```dart
  /// response.mayBeWhen(
  ///   loadTransaction: () {
  //       Do some actions only if the response is Purpose.loadTransaction"
  ///   }
  ///   orElse: () {
  //       Do some actions only if the response is not found
  ///   }
  /// );
  /// ```
  T mayBeWhen<T>({
    T Function()? loadTransaction,
    T Function()? successfulTransaction,
    T Function()? declinedTransaction,
    T Function()? marketingCommunication,
    required T Function() orElse,
  }) {
    final items = {
      Purpose.loadTransaction: loadTransaction,
      Purpose.successfulTransaction: successfulTransaction,
      Purpose.declinedTransaction: declinedTransaction,
      Purpose.marketingCommunication: marketingCommunication,
    };
    final f = items[this];
    return (f != null) ? f() : orElse();
  }

  /// Use `map()` method when you want to perform some action based on the enum
  /// ```dart
  /// response.map(
  ///   loadTransaction: (e) {
  //       Do some actions only if the response is Purpose.loadTransaction"
  ///   }
  ///   successfulTransaction: (e) {
  //       Do some actions only if the response is Purpose.successfulTransaction"
  ///   }
  ///   declinedTransaction: (e) {
  //       Do some actions only if the response is Purpose.declinedTransaction"
  ///   }
  ///   marketingCommunication: (e) {
  //       Do some actions only if the response is Purpose.marketingCommunication"
  ///   }
  /// );
  /// ```
  T map<T>({
    required T Function(Purpose loadTransaction) loadTransaction,
    required T Function(Purpose successfulTransaction) successfulTransaction,
    required T Function(Purpose declinedTransaction) declinedTransaction,
    required T Function(Purpose marketingCommunication) marketingCommunication,
  }) {
    final items = {
      Purpose.loadTransaction: loadTransaction,
      Purpose.successfulTransaction: successfulTransaction,
      Purpose.declinedTransaction: declinedTransaction,
      Purpose.marketingCommunication: marketingCommunication,
    };
    return items[this]!(this);
  }

  T mayBeMap<T>({
    T Function(Purpose loadTransaction)? loadTransaction,
    T Function(Purpose successfulTransaction)? successfulTransaction,
    T Function(Purpose declinedTransaction)? declinedTransaction,
    T Function(Purpose marketingCommunication)? marketingCommunication,
    required T Function() orElse,
  }) {
    final items = {
      Purpose.loadTransaction: loadTransaction,
      Purpose.successfulTransaction: successfulTransaction,
      Purpose.declinedTransaction: declinedTransaction,
      Purpose.marketingCommunication: marketingCommunication,
    };
    final f = items[this];
    return (f != null) ? f(this) : orElse();
  }
}
