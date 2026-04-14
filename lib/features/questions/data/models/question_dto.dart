import 'package:json_annotation/json_annotation.dart';
import 'package:team_5_examapp/config/models/exam_model.dart';
import 'package:team_5_examapp/features/questions/data/models/answer_dto.dart';
import 'package:team_5_examapp/features/questions/domain/entities/question_entity.dart';

part 'question_dto.g.dart';

@JsonSerializable()
class QuestionDto {
  @JsonKey(name: "_id")
  final String? id;

  @JsonKey(name: "question")
  final String? question;

  @JsonKey(name: "answers")
  final List<AnswerDto>? answers;

  @JsonKey(name: "type")
  final String? type;

  @JsonKey(name: "correct")
  final String? correct;

  @JsonKey(name: "subject")
  final dynamic subject;

  @JsonKey(name: "exam")
  final ExamModel? exam;

  @JsonKey(name: "createdAt")
  final DateTime? createdAt;

  QuestionDto({
    this.id,
    this.question,
    this.answers,
    this.type,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  factory QuestionDto.fromJson(Map<String, dynamic> json) =>
      _$QuestionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionDtoToJson(this);

  QuestionEntity toDomain() => QuestionEntity(
    false,
    null,
    id: id,
    question: question,
    answers: answers ?? [],
    type: type,
    correct: correct,
    subject: subject,
    exam: exam,
  );
}
