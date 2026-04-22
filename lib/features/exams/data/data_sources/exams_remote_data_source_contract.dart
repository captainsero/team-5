import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/models/exams_dto.dart';

abstract class ExamsRemoteDataSourceContract {
  Future<BaseResponse<List<ExamDto>>> getExamsBySubject({
    required String token,
    required String subjectId,
  });
}