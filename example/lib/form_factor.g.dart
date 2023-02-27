// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_factor.dart';

// **************************************************************************
// EnumWhenGenerator
// **************************************************************************

extension FormFactorPatternMatch on FormFactor {
  T map<T>({
    required T Function(FormFactor plastic) plastic,
    required T Function(FormFactor virtual) virtual,
  }) {
    final items = {
      FormFactor.plastic: plastic,
      FormFactor.virtual: virtual,
    };
    return items[this]!(this);
  } // _map

  T when<T>({
    required T Function() plastic,
    required T Function() virtual,
  }) {
    final items = {
      FormFactor.plastic: plastic,
      FormFactor.virtual: virtual,
    };
    return items[this]!();
  } // _when

  T mayBeMap<T>({
    T Function(FormFactor plastic)? plastic,
    T Function(FormFactor virtual)? virtual,
    required T Function() orElse,
  }) {
    final items = {
      FormFactor.plastic: plastic,
      FormFactor.virtual: virtual,
    };
    final f = items[this];
    return (f != null) ? f(this) : orElse();
  } // _mayBeMap

  T mayBeWhen<T>({
    T Function()? plastic,
    T Function()? virtual,
    required T Function() orElse,
  }) {
    final items = {
      FormFactor.plastic: plastic,
      FormFactor.virtual: virtual,
    };
    final f = items[this];
    return (f != null) ? f() : orElse();
  } // _mayBeWhen
} // FormFactorPatternMatch
