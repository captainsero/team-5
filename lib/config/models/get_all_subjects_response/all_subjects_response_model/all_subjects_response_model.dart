import 'package:json_annotation/json_annotation.dart';
import 'package:team_5_examapp/config/models/get_all_subjects_response/meta_data_model/meta_data_dto.dart';

import 'package:team_5_examapp/config/models/get_all_subjects_response/subject_dto/subject_dto.dart';

part 'all_subjects_response_model.g.dart';

@JsonSerializable()
class AllSubjectsResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "subjects")
  final List<SubjectDto> subjects;

  AllSubjectsResponseModel({
    required this.message,
    required this.metadata,
    required this.subjects,
  });

  AllSubjectsResponseModel copyWith({
    String? message,
    MetadataDto? metadata,
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
