import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/base_state/base_state.dart';
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

  Future<void> forgetPassword(String email) async {
    emit(
      state.copyWith(
        forgetPasswordState: state.forgetPasswordState.copyWith(
          isLoading: true,
        ),
      ),
    );

    final response = await forgetPassUseCase(email: email);

    switch (response) {
      case SucceessBaseResponse():
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
      case SucceessBaseResponse():
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
}
