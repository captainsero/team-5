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

  Future<void> clearError() async {
    emit(LoginState(
      loginState: BaseState(isLoading: false),
    ));
  }

  Future<void> login({required String email, required String password, bool rememberMe = false}) async {
    emit(
      state.copyWith(
        loginState: state.loginState.copyWith(isLoading: true),
      ),
    );

    final response = await loginUseCase(email, password);

    switch (response) {
      case SucceessBaseResponse<UserModel>():
      // Save token and email if rememberMe is true
        if (rememberMe) {
          await SecureStorageService.write(
              key: SecureStorageKeys.userToken, value: response.data?.token ?? '');
          await SecureStorageService.write(
              key: SecureStorageKeys.userEmail, value: email);
        }

        emit(
          state.copyWith(
            loginState: state.loginState.copyWith(
              isLoading: false,
              data: response.data,
              errorMessage: null,
            ),
          ),
        );
        break;

      case ErrorBaseResponse<UserModel>():
        emit(
          state.copyWith(
            loginState: state.loginState.copyWith(
              isLoading: false,
              errorMessage: response.errorMessage,
            ),
          ),
        );
        break;
    }
  }

  Future<String?> loadSavedEmail() async {
    final response = await SecureStorageService.read(key: SecureStorageKeys.userEmail);
    switch (response) {
      case SucceessBaseResponse<String>(data: final email):
        return email;
      case ErrorBaseResponse<String>():
        return null;
    }
  }
}