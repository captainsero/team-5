import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/questions/data/models/question_model.dart';

abstract class QuestionsRemoteDataSourceContract {
  Future<BaseResponse<List<QuestionModel>>> getAllQuestionsOnExam({
    required String token,
    required String examId,
  });
}
