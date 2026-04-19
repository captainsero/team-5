part of 'login_view_model.dart';

class LoginState {
  final BaseState<UserEntity> loginState;

  final bool isLoginAttempted;
  final bool rememberMe;
  final bool obscurePassword;
  final String? savedEmail;

  LoginState({
    BaseState<UserEntity>? loginState,
    this.isLoginAttempted = false,
    this.rememberMe = false,
    this.obscurePassword = true,
    this.savedEmail,
  }) : loginState = loginState ?? BaseState<UserEntity>(isLoading: false);

  LoginState copyWith({
    BaseState<UserEntity>? loginState,
    bool? isLoginAttempted,
    bool? rememberMe,
    bool? obscurePassword,
    String? savedEmail,
  }) {
    return LoginState(
      loginState: loginState ?? this.loginState,
      isLoginAttempted: isLoginAttempted ?? this.isLoginAttempted,
      rememberMe: rememberMe ?? this.rememberMe,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      savedEmail: savedEmail ?? this.savedEmail,
    );
  }
}
