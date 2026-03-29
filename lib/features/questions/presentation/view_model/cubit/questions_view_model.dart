import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/base_state/base_state.dart';
import 'package:team_5_examapp/config/response_handler/response_handler.dart';
import 'package:team_5_examapp/features/questions/data/models/responses/check_question_request.dart';
import 'package:team_5_examapp/features/questions/data/models/responses/check_question_response.dart';
import 'package:team_5_examapp/features/questions/domain/entities/question_model.dart';
import 'package:team_5_examapp/features/questions/domain/use_cases/check_questions_use_case.dart';
import 'package:team_5_examapp/features/questions/domain/use_cases/get_all_questions_on_exam_use_case.dart';

part 'questions_state.dart';

@injectable
class QuestionsViewModel extends Cubit<QuestionsState> {
  QuestionsViewModel({
    required this.getAllQuestionsOnExamUseCase,
    required this.checkQuestionsUseCase,
  }) : super(QuestionsState());

  final GetAllQuestionsOnExamUseCase getAllQuestionsOnExamUseCase;
  final CheckQuestionsUseCase checkQuestionsUseCase;

  Future<void> getAllQuestionsOnExam({
    required String token,
    required String examId,
  }) async {
    emit(
      state.copyWith(
        getAllQuestionsOnExamState: state.getAllQuestionsOnExamState.copyWith(
          isLoading: true,
          data: null,
          errorMessage: null,
        ),
      ),
    );

    final response = await getAllQuestionsOnExamUseCase(
      token: token,
      examId: examId,
    );

    switch (response) {
      case SuccessBaseResponse<List<QuestionModel>>():
        emit(
          state.copyWith(
            getAllQuestionsOnExamState: state.getAllQuestionsOnExamState
                .copyWith(
                  isLoading: false,
                  data: response.data,
                  errorMessage: null,
                ),
          ),
        );
        break;
      case ErrorBaseResponse<List<QuestionModel>>():
        emit(
          state.copyWith(
            getAllQuestionsOnExamState: state.getAllQuestionsOnExamState
                .copyWith(isLoading: false, data: null, errorMessage: null),
          ),
        );
    }
  }

  Future<void> checkQuestions({
    required CheckQuestionRequest checkQuestionRequest,
    required String token,
  }) async {
    emit(
      state.copyWith(
        checkQuestions: state.checkQuestions.copyWith(
          isLoading: true,
          data: null,
          errorMessage: null,
        ),
      ),
    );

    final response = await checkQuestionsUseCase(
      checkQuestionRequest: checkQuestionRequest,
      token: token,
    );
    final handler = ResponseHandler.handle<CheckQuestionResponse>(response);
    emit(
      state.copyWith(
        checkQuestions: state.checkQuestions.copyWith(
          isLoading: handler.isLoading,
          data: handler.data,
          errorMessage: handler.errorMessage,
        ),
      ),
    );
  }
}
