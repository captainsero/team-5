import 'package:bloc/bloc.dart';
import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_state/base_state.dart';
import 'package:team_5_examapp/config/response_handler/response_handler.dart';
import 'package:team_5_examapp/config/response_handler/secure_storage_handler.dart';
import 'package:team_5_examapp/config/secure_storage/secure_storage_keys.dart';
import 'package:team_5_examapp/config/secure_storage/secure_storage_service.dart';
import 'package:team_5_examapp/features/questions/data/models/check_answer_dto.dart';
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
  Box<CheckAnswerDto>? answersBox;

  Future<void> getAllQuestionsOnExam({required String examId}) async {
    emit(
      state.copyWith(
        getAllQuestionsOnExamState: state.getAllQuestionsOnExamState.copyWith(
          isLoading: true,
          data: null,
          errorMessage: null,
        ),
      ),
    );

    await SecureStorageService.write(
      key: SecureStorageKeys.userToken,
      value:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5YWFlMmRjY2ViMmM1OWY4NGEzYzgwYSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzc0MzQxNzcyfQ.dmwjX7TEFbEDug4QV_fDzFsjnWFy936WML8ywAAL1Co',
    );

    final token = await SecureStorageService.read(
      key: SecureStorageKeys.userToken,
    );
    final tokenHandler = SecureStorageHandler.handle(token);

    final response = await getAllQuestionsOnExamUseCase(
      token: tokenHandler.data ?? '',
      examId: examId,
    );

    final handler = ResponseHandler.handle<List<QuestionModel>>(response);

    if (handler.data != null) {
      final boxName = handler.data![0].exam.id;

      answersBox = await Hive.openBox<CheckAnswerDto>(boxName);
    }

    emit(
      state.copyWith(
        getAllQuestionsOnExamState: state.getAllQuestionsOnExamState.copyWith(
          isLoading: handler.isLoading,
          data: handler.data,
          errorMessage: handler.errorMessage,
        ),
      ),
    );
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

  void nextQuestion(List<QuestionModel> questions) {
    final current = state.currentQuestion;

    if (current == questions.length - 1) return;

    final nextIndex = current + 1;

    final data = answersBox?.get(questions[nextIndex].id);

    emit(
      state.copyWith(
        currentQuestion: nextIndex,
        currentAnswer: data?.correct ?? '',
        isLast: nextIndex == questions.length - 1,
      ),
    );
  }

  void previousQuestion(List<QuestionModel> questions) {
    final current = state.currentQuestion;

    if (current == 0) return;

    final prevIndex = current - 1;

    final data = answersBox?.get(questions[prevIndex].id);

    emit(
      state.copyWith(
        currentQuestion: prevIndex,
        currentAnswer: data?.correct ?? '',
        isLast: false,
      ),
    );
  }

  void selectAnswer({
  required String questionId,
  required String answerKey,
}) async {
  await answersBox?.put(
    questionId,
    CheckAnswerDto(
      questionId: questionId,
      correct: answerKey,
    ),
  );

  emit(
    state.copyWith(
      currentAnswer: answerKey,
    ),
  );
}

void toggleMultiAnswer({
  required String questionId,
  required String answerKey,
}) async {
  final current = state.currentAnswer ?? '';
  final List<String> selected = current.isEmpty ? [] : current.split(',');

  if (selected.contains(answerKey)) {
    selected.remove(answerKey);
  } else {
    selected.add(answerKey);
  }

  final updated = selected.join(',');

  await answersBox?.put(
    questionId,
    CheckAnswerDto(
      questionId: questionId,
      correct: updated,
    ),
  );

  emit(
    state.copyWith(
      currentAnswer: updated,
    ),
  );
}

}
