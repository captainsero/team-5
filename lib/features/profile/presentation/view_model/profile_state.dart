part of 'profile_view_model.dart';

class ProfileState {
  BaseState<RegisterAndLoginModelResponse> profileResponse =
      BaseState<RegisterAndLoginModelResponse>(isLoading: false);

  ProfileState({BaseState<RegisterAndLoginModelResponse>? profileResponse}) {
    profileResponse = profileResponse ?? this.profileResponse;
  }
}
