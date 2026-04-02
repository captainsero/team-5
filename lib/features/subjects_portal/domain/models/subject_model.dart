import 'package:team_5_examapp/config/models/get_all_subjects_response/subject_dto/subject_dto.dart';

class SubjectModel {
  final String id;
  final String name;
  final String icon;

  SubjectModel({required this.id, required this.name, required this.icon});
  factory SubjectModel.fromDTO(SubjectDto subjectDto) => SubjectModel(
    id: subjectDto.id,
    name: subjectDto.name,
    icon: subjectDto.icon,
  );
}
