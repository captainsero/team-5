import 'package:json_annotation/json_annotation.dart';
import 'package:team_5_examapp/features/questions/data/models/question_dto.dart';

part 'questions_response.g.dart';

@JsonSerializable()
class QuestionsResponse {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "questions")
  final List<QuestionDto> questions;

  QuestionsResponse({required this.message, required this.questions});

  factory QuestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsResponseToJson(this);
}

