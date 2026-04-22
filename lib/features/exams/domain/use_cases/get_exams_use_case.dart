import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/models/exam_model.dart';
import 'package:team_5_examapp/features/exams/domain/repo/exams_repo_contract.dart';


@injectable
class GetExamsBySubjectUseCase {
  final ExamsRepoContract repo;

  GetExamsBySubjectUseCase({required this.repo});

  Future<BaseResponse<List<ExamModel>>> call({
    required String token,
    required String subjectId,
  }) {
    return repo.getExamsBySubject(
      token: token,
      subjectId: subjectId,
    );
  }
}