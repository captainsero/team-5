part of 'questions_view_model.dart';


class QuestionsState {
  BaseState<List<QuestionModel>> getAllQuestionsOnExamState =
      BaseState<List<QuestionModel>>(isLoading: true);

  QuestionsState({BaseState<List<QuestionModel>>? getAllQuestionsOnExamState}) {
    this.getAllQuestionsOnExamState =
        getAllQuestionsOnExamState ??
        BaseState<List<QuestionModel>>(isLoading: true);
  }

  QuestionsState copyWith({
    BaseState<List<QuestionModel>>? getAllQuestionsOnExamState,
  }) {
    return QuestionsState(
      getAllQuestionsOnExamState:
          getAllQuestionsOnExamState ?? this.getAllQuestionsOnExamState,
    );
  }
}
