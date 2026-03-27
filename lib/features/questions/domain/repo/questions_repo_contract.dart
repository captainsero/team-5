import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/questions/domain/entities/question_model.dart';

abstract class QuestionsRepoContract {
  Future<BaseResponse<List<QuestionModel>>> getAllQuestionsOnExam({
    required String token,
    required String examId,
  });
}
