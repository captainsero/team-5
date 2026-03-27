import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/models/exam_model.dart';

abstract class ExamsRepoContract {
  Future<BaseResponse<List<ExamModel>>> getExamsBySubject({
    required String token,
    required String subjectId,
  });
}