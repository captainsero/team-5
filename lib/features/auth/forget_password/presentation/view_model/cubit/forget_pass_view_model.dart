import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/base_state/base_state.dart';
import 'package:team_5_examapp/config/secure_storage/secure_storage_keys.dart';
import 'package:team_5_examapp/config/secure_storage/secure_storage_service.dart';
import 'package:team_5_examapp/features/auth/forget_password/data/models/reset_pass_dto.dart';
import 'package:team_5_examapp/features/auth/forget_password/data/models/responses/forget_password_response.dart';
import 'package:team_5_examapp/features/auth/forget_password/domain/use_cases/confirm_validation_code_use_case.dart';
import 'package:team_5_examapp/features/auth/forget_password/domain/use_cases/forget_pass_use_case.dart';
import 'package:team_5_examapp/features/auth/forget_password/domain/use_cases/reset_pass_use_case.dart';

part 'forget_pass_state.dart';

@injectable
class ForgetPassViewModel extends Cubit<ForgetPassState> {
  ForgetPassViewModel({
    required this.forgetPassUseCase,
    required this.confirmValidationCodeUseCase,
    required this.resetPassUseCase,
  }) : super(ForgetPassState());

  final ForgetPassUseCase forgetPassUseCase;
  final ConfirmValidationCodeUseCase confirmValidationCodeUseCase;
  final ResetPassUseCase resetPassUseCase;

  Future<void> clearError() async {
    emit(
      state.copyWith(
        forgetPasswordState: BaseState(isLoading: false),
        confirmValidationState: BaseState(isLoading: false),
        resetPasswordState: BaseState(isLoading: false),
      ),
    );
  }

  Future<void> forgetPassword({required String email}) async {
    emit(
      state.copyWith(
        forgetPasswordState: state.forgetPasswordState.copyWith(
          isLoading: true,
        ),
      ),
    );

    final response = await forgetPassUseCase(email: email);

    switch (response) {
      case SuccessBaseResponse():
        await SecureStorageService.write(
          key: SecureStorageKeys.userEmail,
          value: email,
        );

        emit(
          state.copyWith(
            forgetPasswordState: state.forgetPasswordState.copyWith(
              isLoading: false,
              data: response.data,
              errorMessage: null,
            ),
          ),
        );
        break;

      case ErrorBaseResponse():
        emit(
          state.copyWith(
            forgetPasswordState: state.forgetPasswordState.copyWith(
              isLoading: false,
              errorMessage: response.errorMessage,
            ),
          ),
        );
        break;
    }
  }

  Future<void> confirmValidationCode({required String resetCode}) async {
    emit(
      state.copyWith(
        confirmValidationState: state.confirmValidationState.copyWith(
          isLoading: true,
        ),
      ),
    );

    final response = await confirmValidationCodeUseCase(resetCode: resetCode);

    switch (response) {
      case SuccessBaseResponse():
        emit(
          state.copyWith(
            confirmValidationState: state.confirmValidationState.copyWith(
              isLoading: false,
              data: response.data,
              errorMessage: null,
            ),
          ),
        );
        break;
      case ErrorBaseResponse():
        emit(
          state.copyWith(
            confirmValidationState: state.confirmValidationState.copyWith(
              isLoading: false,
              errorMessage: response.errorMessage,
            ),
          ),
        );
        break;
    }
  }

  Future<void> resetPassword({required String newPassword}) async {
    emit(
      state.copyWith(
        resetPasswordState: state.resetPasswordState.copyWith(isLoading: true),
      ),
    );

    //* Didn't delete the email, you can use in login feature @mohamedabda28
    final emailResponse = await SecureStorageService.read(
      key: SecureStorageKeys.userEmail,
    );

    switch (emailResponse) {
      case SuccessBaseResponse<String>(data: final email):
        final response = await resetPassUseCase(
          resetPassDto: ResetPassDto(email: email, newPassword: newPassword),
        );

        switch (response) {
          case SuccessBaseResponse():
            emit(
              state.copyWith(
                resetPasswordState: state.resetPasswordState.copyWith(
                  isLoading: false,
                  data: response.data,
                  errorMessage: null,
                ),
              ),
            );
            break;
          case ErrorBaseResponse():
            emit(
              state.copyWith(
                resetPasswordState: state.resetPasswordState.copyWith(
                  isLoading: false,
                  data: null,
                  errorMessage: response.errorMessage,
                ),
              ),
            );
            break;
        }
        break;

      case ErrorBaseResponse<String>():
        emit(
          state.copyWith(
            resetPasswordState: state.resetPasswordState.copyWith(
              isLoading: false,
              errorMessage: 'Please start again later.',
            ),
          ),
        );
        break;
    }
  }

  Future<void> resendCode() async {
    final emailResponse = await SecureStorageService.read(
      key: SecureStorageKeys.userEmail,
    );

    switch (emailResponse) {
      case SuccessBaseResponse<String>(data: final email):
        // reuse the existing logic
        await forgetPassword(email: email);
        break;

      case ErrorBaseResponse<String>():
        emit(
          state.copyWith(
            forgetPasswordState: state.forgetPasswordState.copyWith(
              isLoading: false,
              errorMessage: 'Please start the process again.',
            ),
          ),
        );
        break;
    }
  }

  Future<String> getUserEmail() async {
    final emailResponse = await SecureStorageService.read(
      key: SecureStorageKeys.userEmail,
    );

    switch (emailResponse) {
      case SuccessBaseResponse<String>(data: final email):
        return email;

      case ErrorBaseResponse<String>():
        return '';
    }
  }
}
