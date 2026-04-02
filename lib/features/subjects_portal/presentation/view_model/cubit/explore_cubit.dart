import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_5_examapp/config/base_state/base_state.dart';
import 'package:team_5_examapp/config/response_handler/response_handler.dart';
import 'package:team_5_examapp/config/response_handler/secure_storage_handler.dart';
import 'package:team_5_examapp/config/secure_storage/secure_storage_keys.dart';
import 'package:team_5_examapp/config/secure_storage/secure_storage_service.dart';
import 'package:team_5_examapp/features/subjects_portal/domain/models/subject_model.dart';
import 'package:team_5_examapp/features/subjects_portal/domain/use_cases/get_all_subjects_use_case.dart';
part 'explore_state.dart';

@injectable
class ExploreCubit extends Cubit<ExploreState> {
  final GetAllSubjectsUseCase getAllSubjectsUseCase;

  ExploreCubit({required this.getAllSubjectsUseCase}) : super(ExploreState());

  Future<void> getAllSubjects({required String token}) async {
    final token = await SecureStorageService.read(
      key: SecureStorageKeys.userToken,
    );

    final tokenHandler = SecureStorageHandler.handle(token);

    emit(
      state.copyWith(
        subjectState: state.subjectState.copyWith(isLoading: true),
      ),
    );

    final subjects = await getAllSubjectsUseCase.call(tokenHandler.data!);
    emit(
      state.copyWith(
        subjectState: state.subjectState.copyWith(isLoading: false),
      ),
    );
    ResponseHandler.handle(subjects);
  }

  Future<void> changeTab(int index) async {
    emit(state.copyWithIndex(currentIndex: index));
  }

  void search(String query) {
    final results = state.filteredSubjects.where((subject) {
      return subject.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    emit(state.copyWith(searchQuery: query, filteredSubjects: results));
  }
}
