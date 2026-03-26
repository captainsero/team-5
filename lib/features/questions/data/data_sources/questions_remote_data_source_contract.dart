import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/questions/data/models/responses/questions_response.dart';

abstract class QuestionsRemoteDataSourceContract {
  Future<BaseResponse<QuestionsResponse>> getAllQuestionsOnExam({
    required String token,
    required String examId,
  });
}
