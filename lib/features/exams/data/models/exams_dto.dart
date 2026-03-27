import 'package:json_annotation/json_annotation.dart';
import 'package:team_5_examapp/config/models/exam_model.dart';

part 'exam_dto.g.dart';

@JsonSerializable()
class ExamDto {
  @JsonKey(name: "_id")
  final String id;

  final String title;
  final int duration;

  @JsonKey(name: "numberOfQuestions")
  final int numberOfQuestions;

  final String subject;
  final bool active;
  final DateTime createdAt;

  ExamDto({
    required this.id,
    required this.title,
    required this.duration,
    required this.numberOfQuestions,
    required this.subject,
    required this.active,
    required this.createdAt,
  });

  factory ExamDto.fromJson(Map<String, dynamic> json) =>
      _$ExamDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExamDtoToJson(this);

  ExamModel toDomain() => ExamModel(
    id: id,
    title: title,
    duration: duration,
    numberOfQuestions: numberOfQuestions,
    subject: subject,
    active: active,
    createdAt: createdAt,
  );
}