import 'package:json_annotation/json_annotation.dart';

import '../../domain/models/result_model.dart';

part 'result_dto.g.dart';

@JsonSerializable()
class ResultDto {
  final String id;
  final String title;
  final String subject;
  final int duration;
  final int questions;
  final int correctAnswers;
  final int timeTaken;

  ResultDto({
    required this.id,
    required this.title,
    required this.subject,
    required this.duration,
    required this.questions,
    required this.correctAnswers,
    required this.timeTaken,
  });

  factory ResultDto.fromJson(Map<String, dynamic> json) =>
      _$ResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ResultDtoToJson(this);

  ResultModel toDomain() {
    return ResultModel(
      id: id,
      title: title,
      subject: subject,
      duration: duration,
      questions: questions,
      correctAnswers: correctAnswers,
      timeTaken: timeTaken,
    );
  }
}