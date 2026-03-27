import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/questions/domain/entities/question_model.dart';
import 'package:team_5_examapp/features/questions/domain/repo/questions_repo_contract.dart';

@injectable
class GetAllQuestionsOnExamUseCase {
  final QuestionsRepoContract questionsRepo;

  GetAllQuestionsOnExamUseCase({required this.questionsRepo});

  Future<BaseResponse<List<QuestionModel>>> call({
    required String token,
    required String examId,
  }) async {
    return await questionsRepo.getAllQuestionsOnExam(
      token: token,
      examId: examId,
    );
  }
}
