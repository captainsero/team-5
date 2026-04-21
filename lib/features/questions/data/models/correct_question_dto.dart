import 'package:json_annotation/json_annotation.dart';
import 'package:team_5_examapp/features/questions/data/models/answer_dto.dart';

part 'correct_question_dto.g.dart';

@JsonSerializable()
class CorrectQuestionDto {
  @JsonKey(name: "QID")
  final String? qid;

  @JsonKey(name: "Question")
  final String? question;

  @JsonKey(name: "correctAnswer")
  final String? correctAnswer;

  @JsonKey(name: "answers")
  final AnswerDto? answers;

  CorrectQuestionDto({
    this.qid,
    this.question,
    this.correctAnswer,
    this.answers,
  });

  factory CorrectQuestionDto.fromJson(Map<String, dynamic> json) =>
      _$CorrectQuestionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CorrectQuestionDtoToJson(this);
}
