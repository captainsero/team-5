import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/questions/data/models/responses/check_question_request.dart';
import 'package:team_5_examapp/features/questions/data/models/responses/check_question_response.dart';
import 'package:team_5_examapp/features/questions/domain/entities/question_entity.dart';

abstract interface class QuestionsRepoContract {
  Future<BaseResponse<List<QuestionEntity>>> getAllQuestionsOnExam({
    required String token,
    required String examId,
  });

    Future<BaseResponse<CheckQuestionResponse>> checkQuestions({
    required CheckQuestionRequest checkQuestionRequest,
    required String token
  });
}
