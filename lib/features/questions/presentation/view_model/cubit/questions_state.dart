part of 'questions_view_model.dart';

class QuestionsState {
  BaseState<List<QuestionModel>> getAllQuestionsOnExamState =
      BaseState<List<QuestionModel>>(isLoading: true);

  BaseState<CheckQuestionResponse> checkQuestions =
      BaseState<CheckQuestionResponse>(isLoading: true);

  QuestionsState({
    BaseState<List<QuestionModel>>? getAllQuestionsOnExamState,
    BaseState<CheckQuestionResponse>? checkQuestions,
  }) {
    this.getAllQuestionsOnExamState =
        getAllQuestionsOnExamState ??
        BaseState<List<QuestionModel>>(isLoading: true);
    this.checkQuestions =
        checkQuestions ?? BaseState<CheckQuestionResponse>(isLoading: true);
  }

  QuestionsState copyWith({
    BaseState<List<QuestionModel>>? getAllQuestionsOnExamState,
    BaseState<CheckQuestionResponse>? checkQuestions,
  }) {
    return QuestionsState(
      getAllQuestionsOnExamState:
          getAllQuestionsOnExamState ?? this.getAllQuestionsOnExamState,
      checkQuestions: checkQuestions ?? this.checkQuestions,
    );
  }
}
