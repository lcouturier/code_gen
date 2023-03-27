// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_factor.dart';

// **************************************************************************
// EnumWhenGenerator
// **************************************************************************

extension ExtensionFormFactor on FormFactor {
  /// Is [true] when this is equal to FormFactor.plastic else [false]
  bool get isPlastic => this == FormFactor.plastic;

  /// Is [true] when this is equal to FormFactor.virtual else [false]
  bool get isVirtual => this == FormFactor.virtual;
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

  T mayBeWhen<T>({
    T Function()? plastic,
    T Function()? virtual,
    required T Function() orElse,
  }) {
    assert(() {
      if (plastic == null && virtual == null) {
        throw 'check for at least one case';
      }
      return true;
    }());
    final items = {
      FormFactor.plastic: plastic,
      FormFactor.virtual: virtual,
    };
    return items[this]?.call() ?? orElse();
  }

  T mayBeMap<T>({
    T Function(FormFactor)? plastic,
    T Function(FormFactor)? virtual,
    required T Function() orElse,
  }) {
    assert(() {
      if (plastic == null && virtual == null) {
        throw 'check for at least one case';
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
