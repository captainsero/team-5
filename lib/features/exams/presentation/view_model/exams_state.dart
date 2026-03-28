part of 'exams_view_model.dart';

class ExamsState {
  BaseState<List<ExamModel>> examsState =
  BaseState(isLoading: true);

  ExamsState({BaseState<List<ExamModel>>? examsState}) {
    this.examsState = examsState ?? BaseState(isLoading: true);
  }

  ExamsState copyWith({
    BaseState<List<ExamModel>>? examsState,
  }) {
    return ExamsState(
      examsState: examsState ?? this.examsState,
    );
  }
}