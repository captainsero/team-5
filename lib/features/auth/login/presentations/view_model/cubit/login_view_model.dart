import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_state/base_state.dart';
import 'package:team_5_examapp/config/response_handler/response_handler.dart';
import 'package:team_5_examapp/config/secure_storage/secure_storage_keys.dart';
import 'package:team_5_examapp/config/secure_storage/secure_storage_service.dart';
import 'package:team_5_examapp/features/auth/login/domain/models/user_entity.dart';
import 'package:team_5_examapp/features/auth/login/domain/use_cases/login_use_cases.dart';

part 'login_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginViewModel({required this.loginUseCase}) : super(LoginState()) {
    initialize();
  }

  Future<void> initialize() async {
    emit(state.copyWith(isInitializing: true));
    await loadSavedEmail();
    emit(state.copyWith(isInitializing: false));
  }

  void clearError() {
    emit(state.copyWith(loginState: BaseState<UserEntity>(isLoading: false)));
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
        loginState: const BaseState<UserEntity>(isLoading: true),
      ),
    );

    final response = await loginUseCase(email, password);
    final newState = ResponseHandler.handle(response);

    emit(state.copyWith(loginState: newState));

    if (newState.data != null) {
      if (rememberMe) {
        await SecureStorageService.write(
          key: SecureStorageKeys.userEmail,
          value: email,
        );
      } else {
        await SecureStorageService.delete(key: SecureStorageKeys.userEmail);
      }
    }
  }

  Future<void> loadSavedEmail() async {
    final savedEmail = await loginUseCase.getSavedEmail();

    if (savedEmail != null && savedEmail.isNotEmpty) {
      emit(state.copyWith(savedEmail: savedEmail, rememberMe: true));
    }
  }
}
