// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purpose.dart';

// **************************************************************************
// EnumWhenGenerator
// **************************************************************************

extension PurposePatternMatch on Purpose {
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
  } // _map

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
  } // _when

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
  } // _mayBeMap

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
  } // _mayBeWhen
} // PurposePatternMatch
