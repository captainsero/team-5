part of 'result_view_model.dart';

class ResultsState {
  BaseState<List<ResultModel>> resultsState =
  BaseState(isLoading: true);

  ResultsState({BaseState<List<ResultModel>>? resultsState}) {
    this.resultsState = resultsState ?? BaseState(isLoading: true);
  }

  ResultsState copyWith({
    BaseState<List<ResultModel>>? resultsState,
  }) {
    return ResultsState(
      resultsState: resultsState ?? this.resultsState,
    );
  }
}