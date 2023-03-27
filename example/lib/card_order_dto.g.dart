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

extension ExtensionState on State {
  /// Is [true] when this is equal to State.enabled else [false]
  bool get isEnabled => this == State.enabled;

  /// Is [true] when this is equal to State.disabled else [false]
  bool get isDisabled => this == State.disabled;
  T when<T>({
    required T Function() enabled,
    required T Function() disabled,
  }) {
    switch (this) {
      case State.enabled:
        return enabled();
      case State.disabled:
        return disabled();
    }
  }

  T map<T>({
    required T Function(State) enabled,
    required T Function(State) disabled,
  }) {
    switch (this) {
      case State.enabled:
        return enabled(this);
      case State.disabled:
        return disabled(this);
    }
  }

  T mayBeWhen<T>({
    T Function()? enabled,
    T Function()? disabled,
    required T Function() orElse,
  }) {
    assert(() {
      if (enabled == null && disabled == null) {
        throw 'check for at least one case';
      }
      return true;
    }());
    final items = {
      State.enabled: enabled,
      State.disabled: disabled,
    };
    return items[this]?.call() ?? orElse();
  }

  T mayBeMap<T>({
    T Function(State)? enabled,
    T Function(State)? disabled,
    required T Function() orElse,
  }) {
    assert(() {
      if (enabled == null && disabled == null) {
        throw 'check for at least one case';
      }
      return true;
    }());
    final items = {
      State.enabled: enabled,
      State.disabled: disabled,
    };
    return items[this]?.call(this) ?? orElse();
  }
}
