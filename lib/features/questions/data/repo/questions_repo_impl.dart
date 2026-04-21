import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/response_handler/secure_storage_handler.dart';
import 'package:team_5_examapp/config/secure_storage/secure_storage_keys.dart';
import 'package:team_5_examapp/config/secure_storage/secure_storage_service.dart';
import 'package:team_5_examapp/features/questions/data/data_sources/questions_remote_data_source_contract.dart';
import 'package:team_5_examapp/features/questions/data/models/question_dto.dart';
import 'package:team_5_examapp/features/questions/data/models/responses/check_question_request.dart';
import 'package:team_5_examapp/features/questions/data/models/responses/check_question_response.dart';
import 'package:team_5_examapp/features/questions/domain/entities/question_entity.dart';
import 'package:team_5_examapp/features/questions/domain/repo/questions_repo_contract.dart';

@Injectable(as: QuestionsRepoContract)
class QuestionsRepoImpl implements QuestionsRepoContract {
  final QuestionsRemoteDataSourceContract questionsRemoteDataSourceContract;

  QuestionsRepoImpl({required this.questionsRemoteDataSourceContract});
  @override
  Future<BaseResponse<List<QuestionEntity>>> getAllQuestionsOnExam({
    required String examId,
  }) async {
    final token = await SecureStorageService.read(
      key: SecureStorageKeys.userToken,
    );
    final tokenHandler = SecureStorageHandler.handle(token);

    final response = await questionsRemoteDataSourceContract
        .getAllQuestionsOnExam(token: tokenHandler.data ?? '', examId: examId);
    switch (response) {
      case SuccessBaseResponse<List<QuestionDto>>():
        return SuccessBaseResponse<List<QuestionEntity>>(
          data: response.data.map((dto) => dto.toDomain()).toList(),
        );
      case ErrorBaseResponse<List<QuestionDto>>():
        return ErrorBaseResponse<List<QuestionEntity>>(
          errorMessage: response.errorMessage,
        );
    }
  }

  @override
  Future<BaseResponse<CheckQuestionResponse>> checkQuestions({
    required CheckQuestionRequest checkQuestionRequest,
  }) async {
    final token = await SecureStorageService.read(
      key: SecureStorageKeys.userToken,
    );
    final tokenHandler = SecureStorageHandler.handle(token);

    return await questionsRemoteDataSourceContract.checkQuestions(
      checkQuestionRequest: checkQuestionRequest,
      token: tokenHandler.data ?? '',
    );
  }
}
