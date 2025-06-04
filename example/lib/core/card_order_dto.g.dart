// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardOrderResultDto _$CardOrderResultDtoFromJson(Map<String, dynamic> json) =>
    CardOrderResultDto(
      cardId: json['cardId'] as String,
    );

Map<String, dynamic> _$CardOrderResultDtoToJson(CardOrderResultDto instance) =>
    <String, dynamic>{
      'cardId': instance.cardId,
    };

// **************************************************************************
// EnumPatternMatchingGenerator
// **************************************************************************

extension ExtensionState on State {
  /// Whether this is equal to  State.enabled.
  bool get isEnabled => this == State.enabled;

  /// Whether this is equal to  State.disabled.
  bool get isDisabled => this == State.disabled;
  static State fromName(String value) {
    return State.values.firstWhere(
      (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => throw ArgumentError("Invalid State value"),
    );
  }

  static State fromOrdinal(int value) {
    if (value < 0 || value >= State.values.length) {
      throw ArgumentError("Invalid State value");
    }
    return State.values[value];
  }

  /// Use when method when you want to perform some action based on the enum
  ///
  /// ```dart
  /// State value = State.enabled;
  /// final result = value.when(
  ///   enabled: () => 'enabled',
  ///   disabled: () => 'disabled',
  /// );
  /// ```
  T when<T>({required T Function() enabled, required T Function() disabled}) {
    return switch (this) {
      State.enabled => enabled(),
      State.disabled => disabled(),
    };
  }

  /// Use map method when you want to perform some action based on the enum
  ///
  /// ```dart
  /// State value = State.enabled;
  /// final result = value.map(
  ///   enabled: (e) => e.toString(),
  ///   disabled: (e) => e.toString(),
  /// );
  /// ```
  T map<T>({
    required T Function(State) enabled,
    required T Function(State) disabled,
  }) {
    return switch (this) {
      State.enabled => enabled(this),
      State.disabled => disabled(this),
    };
  }

  /// Use mayBeWhen method when you want to perform some action based on the enum
  ///
  /// Throws an [ArgumentError] if all parameters are null
  /// ```dart
  /// State value = State.enabled;
  /// final result = value.mayBeWhen(
  ///   enabled: () => 'enabled',
  ///   orElse: () => 'default'
  /// );
  /// ```
  T mayBeWhen<T>({
    T Function()? enabled,
    T Function()? disabled,
    required T Function() orElse,
  }) {
    final items = {State.enabled: enabled, State.disabled: disabled};
    return items[this]?.call() ?? orElse();
  }

  /// Use mayBeMap method when you want to perform some action based on the enum
  ///
  /// Throws an [ArgumentError] if all parameters are null
  /// ```dart
  /// State value = State.enabled;
  /// final result = value.mayBeMap(
  ///   enabled: (e) => e.toString(),
  ///   orElse: () => 'default'
  /// );
  /// ```
  T mayBeMap<T>({
    T Function(State)? enabled,
    T Function(State)? disabled,
    required T Function() orElse,
  }) {
    final items = {State.enabled: enabled, State.disabled: disabled};
    return items[this]?.call(this) ?? orElse();
  }
}
