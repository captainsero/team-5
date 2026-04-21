import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/shared_models/get_all_subjects_response/subject_dto/subject_dto.dart';

abstract class SubjectsPortalRemoteDataSourceContract {
  Future<BaseResponse<List<SubjectDto>>> getAllSubjects({
    required String token,
  });
}
