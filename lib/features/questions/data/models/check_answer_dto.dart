import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'check_answer_dto.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class CheckAnswerDto {
  @HiveField(0)
  @JsonKey(name: "questionId")
  final String questionId;

  @HiveField(1)
  @JsonKey(name: "correct")
  final String correct;

  CheckAnswerDto({
    required this.questionId,
    required this.correct,
  });

  factory CheckAnswerDto.fromJson(Map<String, dynamic> json) =>
      _$CheckAnswerDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CheckAnswerDtoToJson(this);
}