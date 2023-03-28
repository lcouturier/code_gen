// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_factor.dart';

// **************************************************************************
// EnumWhenGenerator
// **************************************************************************

extension ExtensionFormFactor on FormFactor {
  /// Whether this is equal to  FormFactor.plastic.
  bool get isPlastic => this == FormFactor.plastic;

  /// Whether this is equal to  FormFactor.virtual.
  bool get isVirtual => this == FormFactor.virtual;

  /// Use when method when you want to perform some action based on the enum
  ///

  /// ```dart
  /// FormFactor value = FormFactor.plastic;
  /// final result = value.when(
  ///   plastic: () => 'plastic',
  ///   virtual: () => 'virtual',
  /// );
  /// ```
  T when<T>({
    required T Function() plastic,
    required T Function() virtual,
  }) {
    switch (this) {
      case FormFactor.plastic:
        return plastic();
      case FormFactor.virtual:
        return virtual();
    }
  }

  /// Use map method when you want to perform some action based on the enum
  ///

  /// ```dart
  /// FormFactor value = FormFactor.plastic;
  /// final result = value.map(
  ///   plastic: (e) => e.toString(),
  ///   virtual: (e) => e.toString(),
  /// );
  /// ```
  T map<T>({
    required T Function(FormFactor) plastic,
    required T Function(FormFactor) virtual,
  }) {
    switch (this) {
      case FormFactor.plastic:
        return plastic(this);
      case FormFactor.virtual:
        return virtual(this);
    }
  }

  /// Use mayBeWhen method when you want to perform some action based on the enum
  ///
  /// Throws an [ArgumentError] if all parameters are null
  /// ```dart
  /// FormFactor value = FormFactor.plastic;
  /// final result = value.mayBeWhen(
  ///   plastic: () => 'plastic',
  ///   orElse: () => 'default'
  /// );
  /// ```
  T mayBeWhen<T>({
    T Function()? plastic,
    T Function()? virtual,
    required T Function() orElse,
  }) {
    assert(() {
      if (plastic == null && virtual == null) {
        ArgumentError('check for at least one case');
      }
      return true;
    }());
    final items = {
      FormFactor.plastic: plastic,
      FormFactor.virtual: virtual,
    };
    return items[this]?.call() ?? orElse();
  }

  /// Use mayBeMap method when you want to perform some action based on the enum
  ///
  /// Throws an [ArgumentError] if all parameters are null
  /// ```dart
  /// FormFactor value = FormFactor.plastic;
  /// final result = value.mayBeMap(
  ///   plastic: (e) => e.toString(),
  ///   orElse: () => 'default'
  /// );
  /// ```
  T mayBeMap<T>({
    T Function(FormFactor)? plastic,
    T Function(FormFactor)? virtual,
    required T Function() orElse,
  }) {
    assert(() {
      if (plastic == null && virtual == null) {
        ArgumentError('check for at least one case');
      }
      return true;
    }());
    final items = {
      FormFactor.plastic: plastic,
      FormFactor.virtual: virtual,
    };
    return items[this]?.call(this) ?? orElse();
  }
}
