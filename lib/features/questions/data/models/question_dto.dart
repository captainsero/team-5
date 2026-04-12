import 'package:json_annotation/json_annotation.dart';
import 'package:team_5_examapp/config/models/exam_model.dart';
import 'package:team_5_examapp/features/questions/data/models/answer_dto.dart';
import 'package:team_5_examapp/features/questions/domain/entities/question_entity.dart';

part 'question_dto.g.dart';

@JsonSerializable()
class QuestionDto {
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

  QuestionDto({
    required this.id,
    required this.question,
    required this.answers,
    required this.type,
    required this.correct,
    required this.subject,
    required this.exam,
    required this.createdAt,
  });

  factory QuestionDto.fromJson(Map<String, dynamic> json) =>
      _$QuestionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionDtoToJson(this);

  QuestionEntity toDomain() => QuestionEntity(
    false, // IsAnswerd (bool)
    null, // userAnswer
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
