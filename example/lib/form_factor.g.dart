// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_factor.dart';

// **************************************************************************
// EnumWhenGenerator
// **************************************************************************

extension FormFactorPatternMatch on FormFactor {
  T when<T>({
    required T Function() plastic,
    required T Function() virtual,
  }) {
    final items = {
      FormFactor.plastic: plastic,
      FormFactor.virtual: virtual,
    };
    return items[this]!();
  }

  T whenOrElse<T>({
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
  }
}
