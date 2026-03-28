import 'package:json_annotation/json_annotation.dart';
import 'package:team_5_examapp/features/questions/data/models/responses/check_question_response.dart';

part 'wrong_question_dto.g.dart';

@JsonSerializable()
class WrongQuestionDto {
  @JsonKey(name: "QID")
  final String qid;
  @JsonKey(name: "Question")
  final String question;
  @JsonKey(name: "inCorrectAnswer")
  final String inCorrectAnswer;
  @JsonKey(name: "correctAnswer")
  final String correctAnswer;
  @JsonKey(name: "answers")
  final Answers answers;

  WrongQuestionDto({
    required this.qid,
    required this.question,
    required this.inCorrectAnswer,
    required this.correctAnswer,
    required this.answers,
  });

  factory WrongQuestionDto.fromJson(Map<String, dynamic> json) =>
      _$WrongQuestionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WrongQuestionDtoToJson(this);
}
