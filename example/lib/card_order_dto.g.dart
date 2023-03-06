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
// EnumWhenGenerator
// **************************************************************************

extension StateStringExtension on String {
  State get getState => {
        "enabled": State.enabled,
        "disabled": State.disabled,
      }[this]!;
}

extension StateFromStringExtension on Iterable<State> {
  State? fromString(String value) {
    final item =
        value.replaceAll('State.', '').replaceAll('_', '').toLowerCase();
    return cast<State?>().firstWhere(
        (e) =>
            e
                .toString()
                .replaceAll('State.', '')
                .replaceAll('_', '')
                .toLowerCase() ==
            item,
        orElse: () => null);
  }
}

extension StateExtension on State {
  bool get isEnabled => this == State.enabled;
  bool get isDisabled => this == State.disabled;

  String get value => ['enabled', 'disabled'][index];

  /// Use `when()` method when you want to perform some action based on the enum
  /// ```dart
  /// response.when(
  ///   enabled: () {
  //       Do some actions only if the response is State.enabled"
  ///   }
  ///   disabled: () {
  //       Do some actions only if the response is State.disabled"
  ///   }
  /// );
  /// ```
  T when<T>({
    required T Function() enabled,
    required T Function() disabled,
  }) {
    final items = {
      State.enabled: enabled,
      State.disabled: disabled,
    };
    return items[this]!();
  }

  void onlyWhen<T>({
    void Function()? enabled,
    void Function()? disabled,
  }) {
    final items = {
      State.enabled: enabled,
      State.disabled: disabled,
    };
    final f = items[this];
    f?.call();
  }

  /// Use `mayBeWhen()` method when you want to perform some action based on the enum
  /// ```dart
  /// response.mayBeWhen(
  ///   enabled: () {
  //       Do some actions only if the response is State.enabled"
  ///   }
  ///   orElse: () {
  //       Do some actions only if the response is not found
  ///   }
  /// );
  /// ```
  T mayBeWhen<T>({
    T Function()? enabled,
    T Function()? disabled,
    required T Function() orElse,
  }) {
    final items = {
      State.enabled: enabled,
      State.disabled: disabled,
    };
    final f = items[this];
    return (f != null) ? f() : orElse();
  }

  /// Use `map()` method when you want to perform some action based on the enum
  /// ```dart
  /// response.map(
  ///   enabled: (e) {
  //       Do some actions only if the response is State.enabled"
  ///   }
  ///   disabled: (e) {
  //       Do some actions only if the response is State.disabled"
  ///   }
  /// );
  /// ```
  T map<T>({
    required T Function(State enabled) enabled,
    required T Function(State disabled) disabled,
  }) {
    final items = {
      State.enabled: enabled,
      State.disabled: disabled,
    };
    return items[this]!(this);
  }

  T mayBeMap<T>({
    T Function(State enabled)? enabled,
    T Function(State disabled)? disabled,
    required T Function() orElse,
  }) {
    final items = {
      State.enabled: enabled,
      State.disabled: disabled,
    };
    final f = items[this];
    return (f != null) ? f(this) : orElse();
  }
}
