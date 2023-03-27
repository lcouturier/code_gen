// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purpose.dart';

// **************************************************************************
// EnumWhenGenerator
// **************************************************************************

extension ExtensionPurpose on Purpose {
  /// Whether this is equal to  Purpose.loadTransaction.
  bool get isLoadtransaction => this == Purpose.loadTransaction;

  /// Whether this is equal to  Purpose.successfulTransaction.
  bool get isSuccessfultransaction => this == Purpose.successfulTransaction;

  /// Whether this is equal to  Purpose.declinedTransaction.
  bool get isDeclinedtransaction => this == Purpose.declinedTransaction;

  /// Whether this is equal to  Purpose.marketingCommunication.
  bool get isMarketingcommunication => this == Purpose.marketingCommunication;

  /// Use when method when you want to perform some action based on the enum
  ///
  /// ```dart
  /// Purpose value = Purpose.loadTransaction;
  /// final result = value.when(
  ///  loadTransaction: () => 'loadTransaction',
  ///  successfulTransaction: () => 'successfulTransaction',
  ///  declinedTransaction: () => 'declinedTransaction',
  ///  marketingCommunication: () => 'marketingCommunication',
  /// );
  /// ```
  T when<T>({
    required T Function() loadTransaction,
    required T Function() successfulTransaction,
    required T Function() declinedTransaction,
    required T Function() marketingCommunication,
  }) {
    switch (this) {
      case Purpose.loadTransaction:
        return loadTransaction();
      case Purpose.successfulTransaction:
        return successfulTransaction();
      case Purpose.declinedTransaction:
        return declinedTransaction();
      case Purpose.marketingCommunication:
        return marketingCommunication();
    }
  }

  /// Use map method when you want to perform some action based on the enum
  ///
  /// ```dart
  /// Purpose value = Purpose.loadTransaction;
  /// final result = value.map(
  ///  loadTransaction: (e) => e.toString(),
  ///  successfulTransaction: (e) => e.toString(),
  ///  declinedTransaction: (e) => e.toString(),
  ///  marketingCommunication: (e) => e.toString(),
  /// );
  /// ```
  T map<T>({
    required T Function(Purpose) loadTransaction,
    required T Function(Purpose) successfulTransaction,
    required T Function(Purpose) declinedTransaction,
    required T Function(Purpose) marketingCommunication,
  }) {
    switch (this) {
      case Purpose.loadTransaction:
        return loadTransaction(this);
      case Purpose.successfulTransaction:
        return successfulTransaction(this);
      case Purpose.declinedTransaction:
        return declinedTransaction(this);
      case Purpose.marketingCommunication:
        return marketingCommunication(this);
    }
  }

  /// Use mayBeWhen method when you want to perform some action based on the enum
  ///
  /// ```dart
  /// Purpose value = Purpose.loadTransaction;
  /// final result = value.mayBeWhen(
  ///  loadTransaction: () => 'loadTransaction',
  ///  orElse: () => 'default'
  /// );
  /// ```
  T mayBeWhen<T>({
    T Function()? loadTransaction,
    T Function()? successfulTransaction,
    T Function()? declinedTransaction,
    T Function()? marketingCommunication,
    required T Function() orElse,
  }) {
    assert(() {
      if (loadTransaction == null &&
          successfulTransaction == null &&
          declinedTransaction == null &&
          marketingCommunication == null) {
        throw 'check for at least one case';
      }
      return true;
    }());
    final items = {
      Purpose.loadTransaction: loadTransaction,
      Purpose.successfulTransaction: successfulTransaction,
      Purpose.declinedTransaction: declinedTransaction,
      Purpose.marketingCommunication: marketingCommunication,
    };
    return items[this]?.call() ?? orElse();
  }

  /// Use mayBeMap method when you want to perform some action based on the enum
  ///
  /// ```dart
  /// Purpose value = Purpose.loadTransaction;
  /// final result = value.mayBeMap(
  ///  loadTransaction: (e) => e.toString(),
  ///  orElse: () => 'default'
  /// );
  /// ```
  T mayBeMap<T>({
    T Function(Purpose)? loadTransaction,
    T Function(Purpose)? successfulTransaction,
    T Function(Purpose)? declinedTransaction,
    T Function(Purpose)? marketingCommunication,
    required T Function() orElse,
  }) {
    assert(() {
      if (loadTransaction == null &&
          successfulTransaction == null &&
          declinedTransaction == null &&
          marketingCommunication == null) {
        throw 'check for at least one case';
      }
      return true;
    }());
    final items = {
      Purpose.loadTransaction: loadTransaction,
      Purpose.successfulTransaction: successfulTransaction,
      Purpose.declinedTransaction: declinedTransaction,
      Purpose.marketingCommunication: marketingCommunication,
    };
    return items[this]?.call(this) ?? orElse();
  }
}
