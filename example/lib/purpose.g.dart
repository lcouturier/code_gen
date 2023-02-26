// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purpose.dart';

// **************************************************************************
// EnumWhenGenerator
// **************************************************************************

extension PurposePatternMatch on Purpose {
  String get value => [
        'loadTransaction',
        'successfulTransaction',
        'declinedTransaction',
        'marketingCommunication'
      ][index];
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

  T whenOrElse<T>({
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
}
