import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/questions/api/questions_api_client/questions_api_client.dart';
import 'package:team_5_examapp/features/questions/data/data_sources/questions_remote_data_source_contract.dart';
import 'package:team_5_examapp/features/questions/data/models/question_dto.dart';
import 'package:team_5_examapp/features/questions/data/models/responses/check_question_request.dart';
import 'package:team_5_examapp/features/questions/data/models/responses/check_question_response.dart';

@Injectable(as: QuestionsRemoteDataSourceContract)
class QuestionsRemoteDataSourceImpl
    implements QuestionsRemoteDataSourceContract {
  final QuestionsApiClient questionsApiClient;

  QuestionsRemoteDataSourceImpl({required this.questionsApiClient});
  @override
  Future<BaseResponse<List<QuestionDto>>> getAllQuestionsOnExam({
    required String token,
    required String examId,
  }) async {
    try {
      final response = await questionsApiClient.getAllQuestionsOnExam(
        token: token,
        examId: examId,
      );
      return SuccessBaseResponse<List<QuestionDto>>(data: response.questions);
    } catch (e) {
      return ErrorBaseResponse<List<QuestionDto>>(error: e);
    }
  }

  @override
  Future<BaseResponse<CheckQuestionResponse>> checkQuestions({
    required CheckQuestionRequest checkQuestionRequest,
    required String token,
  }) async {
    try {
      final response = await questionsApiClient.checkQuestions(
        checkQuestionRequest: checkQuestionRequest,
        token: token,
      );

      return SuccessBaseResponse<CheckQuestionResponse>(data: response);
    } catch (e) {
      return ErrorBaseResponse<CheckQuestionResponse>(error: e);
    }
  }
}
