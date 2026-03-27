import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/questions/api/questions_api_client/questions_api_client.dart';
import 'package:team_5_examapp/features/questions/data/data_sources/questions_remote_data_source_contract.dart';
import 'package:team_5_examapp/features/questions/data/models/question_model.dart';

@Injectable(as: QuestionsRemoteDataSourceContract)
class QuestionsRemoteDataSourceImpl
    implements QuestionsRemoteDataSourceContract {
  final QuestionsApiClient questionsApiClient;

  QuestionsRemoteDataSourceImpl({required this.questionsApiClient});
  @override
  Future<BaseResponse<List<QuestionModel>>> getAllQuestionsOnExam({
    required String token,
    required String examId,
  }) async {
    try {
      print("Start");
      final response = await questionsApiClient.getAllQuestionsOnExam(
        token: token,
        examId: examId,
      );
      print("Success: ${response.questions}");
      return SuccessBaseResponse<List<QuestionModel>>(data: response.questions);
    } catch (e) {
      print("Error: $e");
      return ErrorBaseResponse<List<QuestionModel>>(error: e);
    }
  }
}
