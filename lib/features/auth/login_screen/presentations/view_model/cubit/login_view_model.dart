import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/base_state/base_state.dart';
import 'package:team_5_examapp/config/secure_storage/secure_storage_keys.dart';
import 'package:team_5_examapp/config/secure_storage/secure_storage_service.dart';
import 'package:team_5_examapp/features/auth/login_screen/domain/models/user_model.dart';
import 'package:team_5_examapp/features/auth/login_screen/domain/use_cases/login_use_cases.dart';

part 'login_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginViewModel({required this.loginUseCase}) : super(LoginState());

  /// Clear any existing errors
  Future<void> clearError() async {
    emit(state.copyWith(
      loginState: state.loginState.copyWith(errorMessage: null),
      emailError: null,
      passwordError: null,
    ));
  }

  /// Toggle password visibility
  void toggleObscurePassword() {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  /// Toggle "Remember Me" checkbox
  void toggleRememberMe() {
    emit(state.copyWith(rememberMe: !state.rememberMe));
  }

  /// Perform login
  Future<void> login({
    required String email,
    required String password,
    bool rememberMe = false,
  }) async {
    // mark login attempt
    emit(state.copyWith(
      isLoginAttempted: true,
      loginState: state.loginState.copyWith(isLoading: true),
      emailError: null,
      passwordError: null,
    ));

    final response = await loginUseCase(email, password);

    if (response is SucceessBaseResponse<UserModel>) {
      if (rememberMe) {
        await SecureStorageService.write(
            key: SecureStorageKeys.userToken, value: response.data?.token ?? '');
        await SecureStorageService.write(
            key: SecureStorageKeys.userEmail, value: email);
      }

      emit(state.copyWith(
        loginState: state.loginState.copyWith(
          isLoading: false,
          data: response.data,
          errorMessage: null,
        ),
      ));
    } else if (response is ErrorBaseResponse<UserModel>) {
      emit(state.copyWith(
        loginState: state.loginState.copyWith(
          isLoading: false,
          errorMessage: response.errorMessage,
        ),
      ));
    }
  }

  /// Load saved email from secure storage
  Future<void> loadSavedEmail() async {
    final response = await SecureStorageService.read(
      key: SecureStorageKeys.userEmail,
    );

    if (response is SucceessBaseResponse<String>) {
      emit(state.copyWith(
        savedEmail: response.data,
        rememberMe: true,
      ));
    }
  }
}