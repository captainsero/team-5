import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/questions/data/models/question_dto.dart';
import 'package:team_5_examapp/features/questions/data/models/responses/check_question_request.dart';
import 'package:team_5_examapp/features/questions/data/models/responses/check_question_response.dart';

abstract class QuestionsRemoteDataSourceContract {
  Future<BaseResponse<List<QuestionDto>>> getAllQuestionsOnExam({
    required String token,
    required String examId,
  });

  Future<BaseResponse<CheckQuestionResponse>> checkQuestions({
    required CheckQuestionRequest checkQuestionRequest,
    required String token
  });
}
