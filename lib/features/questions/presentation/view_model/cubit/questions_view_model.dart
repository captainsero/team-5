import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/base_state/base_state.dart';
import 'package:team_5_examapp/features/questions/domain/entities/question_model.dart';
import 'package:team_5_examapp/features/questions/domain/use_cases/get_all_questions_on_exam_use_case.dart';

part 'questions_state.dart';

@injectable
class QuestionsViewModel extends Cubit<QuestionsState> {
  QuestionsViewModel({required this.getAllQuestionsOnExamUseCase})
    : super(QuestionsState());

  final GetAllQuestionsOnExamUseCase getAllQuestionsOnExamUseCase;

  Future<void> getAllQuestionsOnExam({
    required String token,
    required String examId,
  }) async {
    emit(
      state.copyWith(
        getAllQuestionsOnExamState: state.getAllQuestionsOnExamState.copyWith(
          isLoading: true,
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
}
