import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_state/base_state.dart';
import 'package:team_5_examapp/config/response_handler/response_handler.dart';
import 'package:team_5_examapp/features/questions/data/models/check_answer_dto.dart';
import 'package:team_5_examapp/features/questions/data/models/responses/check_question_request.dart';
import 'package:team_5_examapp/features/questions/data/models/responses/check_question_response.dart';
import 'package:team_5_examapp/features/questions/domain/entities/question_entity.dart';
import 'package:team_5_examapp/features/questions/domain/use_cases/check_questions_use_case.dart';
import 'package:team_5_examapp/features/questions/domain/use_cases/get_all_questions_on_exam_use_case.dart';
import 'package:team_5_examapp/features/questions/presentation/view_model/cubit/questions_events.dart';
import 'package:team_5_examapp/generated/l10n.dart';

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
  Timer? _timer;

  void doEvent(QuestionsEvents event) {
    switch (event) {
      case GetAllQuestionsOnExamEvent():
        _getAllQuestionsOnExam(examId: event.examId);
        break;
      case CheckQuestionsEvent():
        _checkQuestions(time: event.time);
        break;
      case NextQuestionEvent():
        _nextQuestion(questions: event.questions);
        break;
      case PreviousQuestionEvent():
        _previousQuestion(questions: event.questions);
        break;
      case SelectAnswerEvent():
        _selectAnswer(questionId: event.questionId, answerKey: event.answerKey);
        break;
      case ToggleMultiAnswerEvent():
        _toggleMultiAnswer(
          questionId: event.questionId,
          answerKey: event.answerKey,
        );
        break;
      case ResetAnswerBoxEvent():
        _resetAnswersBox();
        break;
      case StopTimerEvent():
        _stopTimer();
        break;
    }
  }

  bool get _isAnswersBoxValid {
    return answersBox != null && answersBox!.isOpen && answersBox!.isNotEmpty;
  }

  void _startTimer(int durationInMinutes) {
    final totalSeconds = durationInMinutes * 60;

    emit(
      state.copyWith(
        remainingSeconds: totalSeconds,
        totalSeconds: totalSeconds,
        isTimeUp: false,
      ),
    );

    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final current = state.remainingSeconds;

      if (current <= 1) {
        timer.cancel();

        emit(state.copyWith(remainingSeconds: 0, isTimeUp: true));
      } else {
        emit(state.copyWith(remainingSeconds: current - 1));
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  Future<void> _getAllQuestionsOnExam({required String examId}) async {
    emit(
      state.copyWith(
        currentQuestion: 0,
        isLast: false,
        getAllQuestionsOnExamState: state.getAllQuestionsOnExamState.copyWith(
          isLoading: true,
          data: null,
          errorMessage: null,
        ),
      ),
    );

    final response = await getAllQuestionsOnExamUseCase(examId: examId);

    final handler = ResponseHandler.handle<List<QuestionEntity>>(response);

    if (handler.data != null) {
      final boxName = handler.data![0].exam!.id;

      answersBox = await Hive.openBox<CheckAnswerDto>(boxName);

      final duration = handler.data![0].exam!.duration;
      _startTimer(duration);

      final data = answersBox?.get(handler.data![0].id);

      emit(
        state.copyWith(
          currentAnswer: data?.correct ?? '',
          getAllQuestionsOnExamState: state.getAllQuestionsOnExamState.copyWith(
            isLoading: handler.isLoading,
            data: handler.data,
            errorMessage: handler.errorMessage,
          ),
        ),
      );
    } else if (handler.data != null && handler.data!.isNotEmpty) {
      emit(
        state.copyWith(
          currentAnswer: null,
          getAllQuestionsOnExamState: state.getAllQuestionsOnExamState.copyWith(
            isLoading: handler.isLoading,
            data: handler.data,
            errorMessage: handler.errorMessage ?? S.current.noQuestionsFound,
          ),
        ),
      );
    }
  }

  Future<void> _checkQuestions({required int time}) async {
    if (!_isAnswersBoxValid) {
      emit(
        state.copyWith(
          checkQuestions: state.checkQuestions.copyWith(
            isLoading: false,
            errorMessage: S.current.answersNotReady,
          ),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        checkQuestions: state.checkQuestions.copyWith(
          isLoading: true,
          data: null,
          errorMessage: null,
        ),
      ),
    );

    await _fillUnansweredQuestions();

    final answers = answersBox!.values.toList();

    final request = CheckQuestionRequest(answers: answers, time: time);

    final response = await checkQuestionsUseCase(checkQuestionRequest: request);

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

  void _nextQuestion({required List<QuestionEntity> questions}) {
    final current = state.currentQuestion;

    if (current == questions.length - 1) {
      _timer!.cancel();
      return;
    }

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

  void _previousQuestion({required List<QuestionEntity> questions}) {
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

  void _selectAnswer({
    required String questionId,
    required String answerKey,
  }) async {
    await answersBox?.put(
      questionId,
      CheckAnswerDto(questionId: questionId, correct: answerKey),
    );

    final questions = state.getAllQuestionsOnExamState.data;
    if (questions != null) {
      final updatedQuestions = questions.map((q) {
        if (q.id == questionId) {
          return q.copyWith(isAnswerd: true);
        }
        return q;
      }).toList();

      emit(
        state.copyWith(
          currentAnswer: answerKey,
          getAllQuestionsOnExamState: state.getAllQuestionsOnExamState.copyWith(
            data: updatedQuestions,
          ),
        ),
      );
    } else {
      emit(state.copyWith(currentAnswer: answerKey));
    }
  }

  void _toggleMultiAnswer({
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
      CheckAnswerDto(questionId: questionId, correct: updated),
    );

    emit(state.copyWith(currentAnswer: updated));
  }

  Future<void> _resetAnswersBox() async {
    if (answersBox != null && answersBox!.isOpen) {
      final name = answersBox!.name;
      await answersBox!.clear();
      await answersBox!.close();
      await Hive.deleteBoxFromDisk(name);
      answersBox = null;
    }
  }

  Future<void> _fillUnansweredQuestions() async {
    if (!_isAnswersBoxValid) {
      return;
    }

    final questions = state.getAllQuestionsOnExamState.data;

    if (questions == null || questions.isEmpty) {
      return;
    }

    for (final question in questions) {
      final existing = answersBox!.get(question.id);
      if (existing == null) {
        await answersBox!.put(
          question.id,
          CheckAnswerDto(questionId: question.id ?? '', correct: 'null'),
        );
      }
    }
  }

  @override
  Future<void> close() {
    _stopTimer();
    return super.close();
  }
}
