part of 'explore_cubit.dart';

class ExploreState {
  final BaseState<List<SubjectModel>> subjectState;
  final int currentIndex;
  final List<SubjectModel> filteredSubjects;

  final String searchQuery;

  ExploreState({
    BaseState<List<SubjectModel>>? subjectState,
    this.currentIndex = 0,
    this.searchQuery = '',
    this.filteredSubjects = const [],
  }) : subjectState =
           subjectState ??
           BaseState<List<SubjectModel>>(isLoading: true, data: []);

  ExploreState copyWith({
    BaseState<List<SubjectModel>>? subjectState,
    int? currentIndex,
    String? searchQuery,
    List<SubjectModel>? filteredSubjects,
  }) {
    return ExploreState(
      subjectState: subjectState ?? this.subjectState,
      currentIndex: currentIndex ?? this.currentIndex,
      searchQuery: searchQuery ?? this.searchQuery,
      filteredSubjects: filteredSubjects ?? this.filteredSubjects,
    );
  }

  ExploreState copyWithIndex({int? currentIndex}) {
    return copyWith(currentIndex: currentIndex);
  }
}
