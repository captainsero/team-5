import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/base_state/base_state.dart';
import 'package:team_5_examapp/config/models/exam_model.dart';
import 'package:team_5_examapp/features/exams/domain/use_cases/get_exams_use_case.dart';


part 'exams_state.dart';

@injectable
class ExamsViewModel extends Cubit<ExamsState> {
  final GetExamsBySubjectUseCase useCase;

  ExamsViewModel({required this.useCase}) : super(ExamsState());

  Future<void> getExams({
    required String token,
    required String subjectId,
  }) async {
    emit(state.copyWith(
      examsState: state.examsState.copyWith(isLoading: true),
    ));

    final response = await useCase(token: token, subjectId: subjectId);

    switch (response) {
      case SuccessBaseResponse<List<ExamModel>>():
        emit(state.copyWith(
          examsState: state.examsState.copyWith(
            isLoading: false,
            data: response.data,
          ),
        ));

      case ErrorBaseResponse<List<ExamModel>>():
        emit(state.copyWith(
          examsState: state.examsState.copyWith(
            isLoading: false,
            errorMessage: response.errorMessage,
          ),
        ));
    }
  }
}