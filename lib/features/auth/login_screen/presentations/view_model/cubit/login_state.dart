// login_state.dart
part of 'login_view_model.dart';

class LoginState {
  BaseState<UserModel> loginState = BaseState<UserModel>(isLoading: false);

  // UI State
  final bool isLoginAttempted;
  final bool rememberMe;
  final bool obscurePassword;
  final String? emailError;
  final String? passwordError;
  final String? savedEmail;

  LoginState({
    BaseState<UserModel>? loginState,
    this.isLoginAttempted = false,
    this.rememberMe = false,
    this.obscurePassword = true,
    this.emailError,
    this.passwordError,
    this.savedEmail,
  }) {
    this.loginState = loginState ?? BaseState<UserModel>(isLoading: false);
  }

  LoginState copyWith({
    BaseState<UserModel>? loginState,
    bool? isLoginAttempted,
    bool? rememberMe,
    bool? obscurePassword,
    String? emailError,
    String? passwordError,
    String? savedEmail,
  }) {
    return LoginState(
      loginState: loginState ?? this.loginState,
      isLoginAttempted: isLoginAttempted ?? this.isLoginAttempted,
      rememberMe: rememberMe ?? this.rememberMe,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      emailError: emailError,
      passwordError: passwordError,
      savedEmail: savedEmail ?? this.savedEmail,
    );
  }
}