import 'package:json_annotation/json_annotation.dart';
import 'package:team_5_examapp/features/questions/data/models/answer_dto.dart';

part 'wrong_question_dto.g.dart';

@JsonSerializable()
class WrongQuestionDto {
  @JsonKey(name: "QID")
  final String? qid;

  @JsonKey(name: "Question")
  final String? question;

  @JsonKey(name: "inCorrectAnswer")
  final String? inCorrectAnswer;

  @JsonKey(name: "correctAnswer")
  final String? correctAnswer;

  @JsonKey(name: "answers")
  final AnswerDto? answers;

  WrongQuestionDto({
    this.qid,
    this.question,
    this.inCorrectAnswer,
    this.correctAnswer,
    this.answers,
  });

  factory WrongQuestionDto.fromJson(Map<String, dynamic> json) =>
      _$WrongQuestionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WrongQuestionDtoToJson(this);
}
