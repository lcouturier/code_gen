// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_factor.dart';

// **************************************************************************
// EnumWhenGenerator
// **************************************************************************

extension FormFactorExtension on FormFactor {
  bool get isPlastic => this == FormFactor.plastic;
  bool get isVirtual => this == FormFactor.virtual;

  String get value => ['plastic', 'virtual'][index];

  /// Use `when()` method when you want to perform some action based on the enum
  /// ```dart
  /// response.when(
  ///   plastic: () {
  //       Do some actions only if the response is FormFactor.plastic"
  ///   }
  ///   virtual: () {
  //       Do some actions only if the response is FormFactor.virtual"
  ///   }
  /// );
  /// ```
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

  void onlyWhen<T>({
    void Function()? plastic,
    void Function()? virtual,
  }) {
    final items = {
      FormFactor.plastic: plastic,
      FormFactor.virtual: virtual,
    };
    final f = items[this];
    f?.call();
  }

  /// Use `mayBeWhen()` method when you want to perform some action based on the enum
  /// ```dart
  /// response.mayBeWhen(
  ///   plastic: () {
  //       Do some actions only if the response is FormFactor.plastic"
  ///   }
  ///   orElse: () {
  //       Do some actions only if the response is not found
  ///   }
  /// );
  /// ```
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
  }

  /// Use `map()` method when you want to perform some action based on the enum
  /// ```dart
  /// response.map(
  ///   plastic: (e) {
  //       Do some actions only if the response is FormFactor.plastic"
  ///   }
  ///   virtual: (e) {
  //       Do some actions only if the response is FormFactor.virtual"
  ///   }
  /// );
  /// ```
  T map<T>({
    required T Function(FormFactor plastic) plastic,
    required T Function(FormFactor virtual) virtual,
  }) {
    final items = {
      FormFactor.plastic: plastic,
      FormFactor.virtual: virtual,
    };
    return items[this]!(this);
  }

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
  }
}
