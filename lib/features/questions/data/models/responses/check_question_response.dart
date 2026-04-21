import 'package:json_annotation/json_annotation.dart';
import 'package:team_5_examapp/features/questions/data/models/correct_question_dto.dart';
import 'package:team_5_examapp/features/questions/data/models/wrong_question_dto.dart';

part 'check_question_response.g.dart';

@JsonSerializable()
class CheckQuestionResponse {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "correct")
  final int correct;
  @JsonKey(name: "wrong")
  final int wrong;
  @JsonKey(name: "total")
  final String total;
  @JsonKey(name: "WrongQuestions")
  final List<WrongQuestionDto> wrongQuestions;
  @JsonKey(name: "correctQuestions")
  final List<CorrectQuestionDto> correctQuestions;

  CheckQuestionResponse({
    required this.message,
    required this.correct,
    required this.wrong,
    required this.total,
    required this.wrongQuestions,
    required this.correctQuestions,
  });

  factory CheckQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckQuestionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckQuestionResponseToJson(this);
}