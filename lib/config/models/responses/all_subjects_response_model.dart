// To parse this JSON data, do
//
//     final allSubjectsResponseModel = allSubjectsResponseModelFromMap(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'package:team_5_examapp/config/models/meta_data_model/meta_data_model.dart';
import 'package:team_5_examapp/config/models/subject_dto/subject_dto.dart';

part 'all_subjects_response_model.g.dart';

@JsonSerializable()
class AllSubjectsResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "subjects")
  final List<SubjectDto> subjects;

  AllSubjectsResponseModel({
    required this.message,
    required this.metadata,
    required this.subjects,
  });

  AllSubjectsResponseModel copyWith({
    String? message,
    Metadata? metadata,
    List<SubjectDto>? subjects,
  }) => AllSubjectsResponseModel(
    message: message ?? this.message,
    metadata: metadata ?? this.metadata,
    subjects: subjects ?? this.subjects,
  );

  factory AllSubjectsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AllSubjectsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllSubjectsResponseModelToJson(this);
}
