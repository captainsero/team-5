import 'package:team_5_examapp/config/shared_models/get_all_subjects_response/subject_dto/subject_dto.dart';

class SubjectEntity
 {
  final String id;
  final String name;
  final String icon;

  SubjectEntity
  ({required this.id, required this.name, required this.icon});
  factory SubjectEntity
  .fromDTO(SubjectDto subjectDto) => SubjectEntity
  (
    id: subjectDto.id,
    name: subjectDto.name,
    icon: subjectDto.icon,
  );
}
