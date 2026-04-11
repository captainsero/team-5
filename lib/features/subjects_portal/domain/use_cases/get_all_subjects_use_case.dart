import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/subjects_portal/domain/models/subject_model.dart';
import 'package:team_5_examapp/features/subjects_portal/domain/repo/subjects_portal_repo_contract.dart';

@injectable
class GetAllSubjectsUseCase {
  final SubjectsPortalRepoContract repo;

  GetAllSubjectsUseCase({required this.repo});

  Future<BaseResponse<List<SubjectModel>>> call(String token) async {
    final subjects = await repo.getAllSubjects(token: token);
    return subjects;
  }
}
