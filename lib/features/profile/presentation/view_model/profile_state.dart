part of 'profile_view_model.dart';

class ProfileState extends Equatable {
  final BaseState<RegisterAndLoginModelResponse> profileState;
  final bool isDirty = false;
  final bool isUpdated = false;

  ProfileState({
    bool isDirty = false,
    bool isUpdated = false,
    BaseState<RegisterAndLoginModelResponse>? profileState,
  }) : profileState =
           profileState ??
           BaseState<RegisterAndLoginModelResponse>(
             isLoading: false,
             data: null,
             errorMessage: null,
           );

  @override
  List<Object?> get props => [profileState, isDirty, isUpdated];

  ProfileState copyWith({
    BaseState<RegisterAndLoginModelResponse>? profileState,
    bool? isDirty,
    bool? isUpdated,
  }) {
    return ProfileState(
      profileState: profileState ?? this.profileState,
      isDirty: isDirty ?? this.isDirty,
      isUpdated: isUpdated ?? this.isUpdated,
    );
  }
}
