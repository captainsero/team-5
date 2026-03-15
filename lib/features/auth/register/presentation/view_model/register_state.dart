part of 'register_view_model.dart';

class RegisterState {
  BaseState<AuthResponse> registerUserState = BaseState<AuthResponse>(
    isLoading: false,
  );

  RegisterState({BaseState<AuthResponse>? registerUserState}) {
    this.registerUserState =
        registerUserState ?? BaseState<AuthResponse>(isLoading: false);
  }

  RegisterState copyWith({BaseState<AuthResponse>? registerUserState}) {
    return RegisterState(
      registerUserState: registerUserState ?? this.registerUserState,
    );
  }
}
