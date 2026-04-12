import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/questions/data/data_sources/questions_remote_data_source_contract.dart';
import 'package:team_5_examapp/features/questions/data/models/question_dto.dart';
import 'package:team_5_examapp/features/questions/data/models/responses/check_question_request.dart';
import 'package:team_5_examapp/features/questions/data/models/responses/check_question_response.dart';
import 'package:team_5_examapp/features/questions/domain/entities/question_model.dart';
import 'package:team_5_examapp/features/questions/domain/repo/questions_repo_contract.dart';

@Injectable(as: QuestionsRepoContract)
class QuestionsRepoImpl implements QuestionsRepoContract {
  final QuestionsRemoteDataSourceContract questionsRemoteDataSourceContract;

  QuestionsRepoImpl({required this.questionsRemoteDataSourceContract});
  @override
  Future<BaseResponse<List<QuestionModel>>> getAllQuestionsOnExam({
    required String token,
    required String examId,
  }) async {
    final response = await questionsRemoteDataSourceContract
        .getAllQuestionsOnExam(token: token, examId: examId);
    switch (response) {
      case SuccessBaseResponse<List<QuestionDto>>():
        return SuccessBaseResponse<List<QuestionModel>>(
          data: response.data.map((dto) => dto.toDomain()).toList(),
        );
      case ErrorBaseResponse<List<QuestionDto>>():
        return ErrorBaseResponse<List<QuestionModel>>(
          errorMessage: response.errorMessage,
        );
    }
  }

  @override
  Future<BaseResponse<CheckQuestionResponse>> checkQuestions({
    required CheckQuestionRequest checkQuestionRequest,
    required String token,
  }) async {
    return await questionsRemoteDataSourceContract.checkQuestions(
      checkQuestionRequest: checkQuestionRequest,
      token: token,
    );
  }
}
