part of 'register_view_model.dart';

class RegisterState {
  BaseState<RegisterAndLoginModelResponse> registerUserState =
      BaseState<RegisterAndLoginModelResponse>(isLoading: false);

  RegisterState({BaseState<RegisterAndLoginModelResponse>? registerUserState}) {
    this.registerUserState =
        registerUserState ??
        BaseState<RegisterAndLoginModelResponse>(isLoading: false);
  }

  RegisterState copyWith({
    BaseState<RegisterAndLoginModelResponse>? registerUserState,
  }) {
    return RegisterState(
      registerUserState: registerUserState ?? this.registerUserState,
    );
  }
}
