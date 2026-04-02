import 'package:json_annotation/json_annotation.dart';
import 'package:team_5_examapp/config/models/get_all_subjects_response/meta_data_model/meta_data_dto.dart';

import 'package:team_5_examapp/config/models/get_all_subjects_response/subject_dto/subject_dto.dart';

part 'all_subject_response_model.g.dart';

@JsonSerializable()
class AllSubjectResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "subjects")
  final List<SubjectDto> subjects;

  AllSubjectResponseModel({
    required this.message,
    required this.metadata,
    required this.subjects,
  });

  AllSubjectResponseModel copyWith({
    String? message,
    MetadataDto? metadata,
    List<SubjectDto>? subjects,
  }) => AllSubjectResponseModel(
    message: message ?? this.message,
    metadata: metadata ?? this.metadata,
    subjects: subjects ?? this.subjects,
  );

  factory AllSubjectResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AllSubjectResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllSubjectResponseModelToJson(this);
}
