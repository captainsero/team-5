import 'package:json_annotation/json_annotation.dart';
import 'package:team_5_examapp/features/exams/data/models/exams_dto.dart';

part 'exams_response.g.dart';

@JsonSerializable()
class ExamsResponse {
  final String message;
  final List<ExamDto> exams;

  final Metadata metadata;

  ExamsResponse({
    required this.message,
    required this.exams,
    required this.metadata,
  });

  factory ExamsResponse.fromJson(Map<String, dynamic> json) =>
      _$ExamsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExamsResponseToJson(this);
}

@JsonSerializable()
class Metadata {
  final int currentPage;
  final int numberOfPages;
  final int limit;

  Metadata({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}