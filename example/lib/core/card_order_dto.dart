// ignore_for_file: depend_on_referenced_packages

import 'package:annotations/annotations.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card_order_dto.g.dart';

@enumExtension
enum State { enabled, disabled }

@JsonSerializable()
class CardOrderResultDto {
  @JsonKey(name: 'cardId')
  final String cardId;

  const CardOrderResultDto({
    required this.cardId,
  });

  factory CardOrderResultDto.fromJson(Map<String, dynamic> json) => _$CardOrderResultDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CardOrderResultDtoToJson(this);
}
