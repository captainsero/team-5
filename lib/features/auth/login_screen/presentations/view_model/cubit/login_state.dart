part of 'login_view_model.dart';

class LoginState {
  BaseState<UserModel> loginState = BaseState<UserModel>(isLoading: false);

  LoginState({BaseState<UserModel>? loginState}) {
    this.loginState = loginState ?? BaseState<UserModel>(isLoading: false);
  }

  LoginState copyWith({BaseState<UserModel>? loginState}) {
    return LoginState(
      loginState: loginState ?? this.loginState,
    );
  }
}