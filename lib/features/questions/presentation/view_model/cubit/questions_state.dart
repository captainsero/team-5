part of 'questions_view_model.dart';

class QuestionsState {
  BaseState<List<QuestionModel>> getAllQuestionsOnExamState =
      BaseState<List<QuestionModel>>(isLoading: true);

  BaseState<CheckQuestionResponse> checkQuestions =
      BaseState<CheckQuestionResponse>(isLoading: true);

  final int currentQuestion;
  final bool isLast;
  final String? currentAnswer;
  final int remainingSeconds;
  final bool isTimeUp;
  final int totalSeconds;

  QuestionsState({
    BaseState<List<QuestionModel>>? getAllQuestionsOnExamState,
    BaseState<CheckQuestionResponse>? checkQuestions,
    this.currentQuestion = 0,
    this.isLast = false,
    this.currentAnswer,
    this.remainingSeconds = 0,
    this.isTimeUp = false,
    this.totalSeconds = 0,
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
    int? currentQuestion,
    bool? isLast,
    String? currentAnswer,
    int? remainingSeconds,
    bool? isTimeUp,
    int? totalSeconds,
  }) {
    return QuestionsState(
      getAllQuestionsOnExamState:
          getAllQuestionsOnExamState ?? this.getAllQuestionsOnExamState,
      checkQuestions: checkQuestions ?? this.checkQuestions,
      currentQuestion: currentQuestion ?? this.currentQuestion,
      isLast: isLast ?? this.isLast,
      currentAnswer: currentAnswer ?? this.currentAnswer,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      isTimeUp: isTimeUp ?? this.isTimeUp,
      totalSeconds: totalSeconds ?? this.totalSeconds,
    );
  }
}
