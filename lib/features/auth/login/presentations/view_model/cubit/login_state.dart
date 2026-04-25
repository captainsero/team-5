part of 'login_view_model.dart';

class LoginState extends Equatable {
  final BaseState<UserEntity> loginState;
  final bool isInitializing;

  final bool isLoginAttempted;
  final bool rememberMe;
  final bool obscurePassword;
  final String? savedEmail;

  LoginState({
    BaseState<UserEntity>? loginState,
    this.isInitializing = true,
    this.isLoginAttempted = false,
    this.rememberMe = false,
    this.obscurePassword = true,
    this.savedEmail,
  }) : loginState = loginState ?? BaseState<UserEntity>(isLoading: false);

  LoginState copyWith({
    BaseState<UserEntity>? loginState,
    bool? isInitializing,
    bool? isLoginAttempted,
    bool? rememberMe,
    bool? obscurePassword,
    String? savedEmail,
  }) {
    return LoginState(
      loginState: loginState ?? this.loginState,
      isInitializing: isInitializing ?? this.isInitializing,
      isLoginAttempted: isLoginAttempted ?? this.isLoginAttempted,
      rememberMe: rememberMe ?? this.rememberMe,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      savedEmail: savedEmail ?? this.savedEmail,
    );
  }

  @override
  List<Object?> get props => [
    loginState,
    isInitializing,
    isLoginAttempted,
    rememberMe,
    obscurePassword,
    savedEmail,
  ];
}
