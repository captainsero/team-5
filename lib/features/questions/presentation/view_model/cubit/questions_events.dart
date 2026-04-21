import 'package:team_5_examapp/features/questions/domain/entities/question_entity.dart';

sealed class QuestionsEvents {}

class GetAllQuestionsOnExamEvent extends QuestionsEvents {
  final String examId;

  GetAllQuestionsOnExamEvent({required this.examId});
}

class CheckQuestionsEvent extends QuestionsEvents {
  final int time;

  CheckQuestionsEvent({required this.time});
}

class NextQuestionEvent extends QuestionsEvents {
  final List<QuestionEntity> questions;

  NextQuestionEvent({required this.questions});
}

class PreviousQuestionEvent extends QuestionsEvents {
  final List<QuestionEntity> questions;

  PreviousQuestionEvent({required this.questions});
}

class SelectAnswerEvent extends QuestionsEvents {
  final String questionId;
  final String answerKey;

  SelectAnswerEvent({required this.questionId, required this.answerKey});
}

class ToggleMultiAnswerEvent extends QuestionsEvents {
  final String questionId;
  final String answerKey;

  ToggleMultiAnswerEvent({required this.questionId, required this.answerKey});
}

class ResetAnswerBoxEvent extends QuestionsEvents {}

class StopTimerEvent extends QuestionsEvents {}
