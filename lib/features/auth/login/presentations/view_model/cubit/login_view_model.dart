import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/base_state/base_state.dart';
import 'package:team_5_examapp/config/response_handler/response_handler.dart';
import 'package:team_5_examapp/config/secure_storage/secure_storage_keys.dart';
import 'package:team_5_examapp/config/secure_storage/secure_storage_service.dart';
import 'package:team_5_examapp/features/auth/login/domain/models/user_model.dart';
import 'package:team_5_examapp/features/auth/login/domain/use_cases/login_use_cases.dart';

part 'login_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginViewModel({required this.loginUseCase}) : super(LoginState());

  void clearError() {
    emit(
      state.copyWith(loginState: state.loginState.copyWith(errorMessage: null)),
    );
  }

  void toggleObscurePassword() {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  void toggleRememberMe() {
    emit(state.copyWith(rememberMe: !state.rememberMe));
  }

  Future<void> login({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    emit(
      state.copyWith(
        isLoginAttempted: true,
        loginState: state.loginState.copyWith(isLoading: true),
      ),
    );

    final response = await loginUseCase(email, password);
    final newState = ResponseHandler.handle(response);

    emit(state.copyWith(loginState: newState));

    //Save email in secure storage  in case of successful login and rememberMe is true

    if (newState.data != null && rememberMe) {
      await SecureStorageService.write(
        key: SecureStorageKeys.userEmail,
        value: email,
      );
    } else {
      await SecureStorageService.delete(key: SecureStorageKeys.userEmail);
    }
  }

  Future<void> loadSavedEmail() async {
    final response = await SecureStorageService.read(
      key: SecureStorageKeys.userEmail,
    );

    if (response is SuccessBaseResponse<String>) {
      emit(state.copyWith(savedEmail: response.data, rememberMe: true));
    }
  }
}
