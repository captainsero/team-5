import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import '../../../../config/base_state/base_state.dart';
import '../../domain/models/result_model.dart';
import '../../domain/use_cases/result_use_case.dart';

part 'result_state.dart';

@injectable
class ResultsViewModel extends Cubit<ResultsState> {
  final GetResultsUseCase useCase;

  ResultsViewModel({required this.useCase}) : super(ResultsState());

  Future<void> getResults({required String token}) async {
    emit(state.copyWith(
      resultsState: state.resultsState.copyWith(isLoading: true),
    ));

    final response = await useCase(token: token);

    switch (response) {
      case SuccessBaseResponse<List<ResultModel>>():
        emit(state.copyWith(
          resultsState: state.resultsState.copyWith(
            isLoading: false,
            data: response.data,
          ),
        ));

      case ErrorBaseResponse<List<ResultModel>>():
        emit(state.copyWith(
          resultsState: state.resultsState.copyWith(
            isLoading: false,
            errorMessage: response.errorMessage,
          ),
        ));
    }
  }
}