import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/questions/data/models/responses/check_question_request.dart';
import 'package:team_5_examapp/features/questions/data/models/responses/check_question_response.dart';
import 'package:team_5_examapp/features/questions/domain/repo/questions_repo_contract.dart';

@injectable
class CheckQuestionsUseCase {
  final QuestionsRepoContract questionsRepo;

  CheckQuestionsUseCase({required this.questionsRepo});

  Future<BaseResponse<CheckQuestionResponse>> call({
    required CheckQuestionRequest checkQuestionRequest,
    required String token,
  }) async {
    return questionsRepo.checkQuestions(
      checkQuestionRequest: checkQuestionRequest,
      token: token,
    );
  }
}
