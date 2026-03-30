import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'answer_dto.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class AnswerDto {
  @HiveField(0)
  @JsonKey(name: "answer")
  final String answer;

  @HiveField(1)
  @JsonKey(name: "key")
  final String key;

  AnswerDto({
    required this.answer,
    required this.key,
  });

  factory AnswerDto.fromJson(Map<String, dynamic> json) =>
      _$AnswerDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerDtoToJson(this);
}