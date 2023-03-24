// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purpose.dart';

// **************************************************************************
// EnumWhenGenerator
// **************************************************************************

extension ExtensionPurpose on Purpose {
  bool get isLoadtransaction => this == Purpose.loadTransaction;
  bool get isSuccessfultransaction => this == Purpose.successfulTransaction;
  bool get isDeclinedtransaction => this == Purpose.declinedTransaction;
  bool get isMarketingcommunication => this == Purpose.marketingCommunication;
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
