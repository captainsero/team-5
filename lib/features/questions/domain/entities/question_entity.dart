import 'package:json_annotation/json_annotation.dart';
import 'package:team_5_examapp/config/models/exam_model.dart';
import 'package:team_5_examapp/features/questions/data/models/answer_dto.dart';

part 'question_entity.g.dart';

@JsonSerializable()
class QuestionEntity {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "question")
  final String question;
  @JsonKey(name: "answers")
  final List<AnswerDto> answers;
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

  bool isAnswerd = false;
  AnswerDto? userAnswer;

  QuestionEntity(
    this.isAnswerd,
    this.userAnswer, {
    required this.id,
    required this.question,
    required this.answers,
    required this.type,
    required this.correct,
    required this.subject,
    required this.exam,
    required this.createdAt,
  });

  QuestionEntity copyWith({bool? isAnswerd, AnswerDto? userAnswer}) {
    return QuestionEntity(
      isAnswerd ?? this.isAnswerd,
      userAnswer ?? this.userAnswer,
      id: id,
      question: question,
      answers: answers,
      type: type,
      correct: correct,
      subject: subject,
      exam: exam,
      createdAt: createdAt,
    );
  }

  factory QuestionEntity.fromJson(Map<String, dynamic> json) =>
      _$QuestionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionEntityToJson(this);
}
