import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/subjects_portal/domain/models/subject_model.dart';

abstract class SubjectsPortalRepoContract {
  Future<BaseResponse<List<SubjectModel>>> getAllSubjects({
    required String token,
  });
}
