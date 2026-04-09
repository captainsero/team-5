part of 'forget_pass_view_model.dart';

class ForgetPassState {
  BaseState<ForgetPasswordResponse> forgetPasswordState =
      BaseState<ForgetPasswordResponse>(isLoading: false);

  BaseState<ForgetPasswordResponse> confirmValidationState =
      BaseState<ForgetPasswordResponse>(isLoading: false);

  BaseState<ForgetPasswordResponse> resetPasswordState =
      BaseState<ForgetPasswordResponse>(isLoading: false);

  ForgetPassState({
    BaseState<ForgetPasswordResponse>? forgetPasswordState,
    BaseState<ForgetPasswordResponse>? confirmValidationState,
    BaseState<ForgetPasswordResponse>? resetPasswordState,
  }) {
    this.forgetPasswordState =
        forgetPasswordState ?? BaseState<ForgetPasswordResponse>();
    this.confirmValidationState =
        confirmValidationState ?? BaseState<ForgetPasswordResponse>();
    this.resetPasswordState =
        resetPasswordState ?? BaseState<ForgetPasswordResponse>();
  }

  ForgetPassState copyWith({
    BaseState<ForgetPasswordResponse>? forgetPasswordState,
    BaseState<ForgetPasswordResponse>? confirmValidationState,
    BaseState<ForgetPasswordResponse>? resetPasswordState,
  }) {
    return ForgetPassState(
      forgetPasswordState: forgetPasswordState ?? this.forgetPasswordState,
      confirmValidationState:
          confirmValidationState ?? this.confirmValidationState,
      resetPasswordState: resetPasswordState ?? this.resetPasswordState,
    );
  }
}
