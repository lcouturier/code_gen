// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_factor.dart';

// **************************************************************************
// EnumPatternMatchingGenerator
// **************************************************************************

extension ExtensionFormFactor on FormFactor {
  /// Whether this is equal to  FormFactor.plastic.
  bool get isPlastic => this == FormFactor.plastic;

  /// Whether this is equal to  FormFactor.virtual.
  bool get isVirtual => this == FormFactor.virtual;

  static FormFactor fromName(String value) {
    return FormFactor.values.firstWhere(
      (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => throw ArgumentError("Invalid FormFactor value"),
    );
  }

  static FormFactor fromOrdinal(int value) {
    if (value < 0 || value >= FormFactor.values.length) {
      throw ArgumentError("Invalid FormFactor value");
    }
    return FormFactor.values[value];
  }

  /// Use when method when you want to perform some action based on the enum
  ///
  /// ```dart
  /// FormFactor value = FormFactor.plastic;
  /// final result = value.when(
  ///   plastic: () => 'plastic',
  ///   virtual: () => 'virtual',
  /// );
  /// ```

  T when<T>({required T Function() plastic, required T Function() virtual}) {
    return switch (this) {
      FormFactor.plastic => plastic(),
      FormFactor.virtual => virtual(),
    };
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

    return switch (this) {
      FormFactor.plastic => plastic(this),
      FormFactor.virtual => virtual(this),
    };
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

    final items = {FormFactor.plastic: plastic, FormFactor.virtual: virtual};
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

    final items = {FormFactor.plastic: plastic, FormFactor.virtual: virtual};
    return items[this]?.call(this) ?? orElse();
  }
}
