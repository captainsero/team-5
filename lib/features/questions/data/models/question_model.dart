import 'package:json_annotation/json_annotation.dart';
import 'package:team_5_examapp/config/models/exam_model.dart';
import 'package:team_5_examapp/features/questions/data/models/answer_model.dart';

part 'question_model.g.dart';

@JsonSerializable()
class QuestionModel {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "question")
  final String question;
  @JsonKey(name: "answers")
  final List<AnswerModel> answers;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "correct")
  final String correct;
  @JsonKey(name: "subject")
  final dynamic subject;
  @JsonKey(name: "exam")
  final ExamModel exam;
  @JsonKey(name: "createdAt")
  final DateTime createdAt;

  QuestionModel({
    required this.id,
    required this.question,
    required this.answers,
    required this.type,
    required this.correct,
    required this.subject,
    required this.exam,
    required this.createdAt,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}
