import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/base_state/base_state.dart';
import 'package:team_5_examapp/features/auth/register/data/models/responses/register_response.dart';
import 'package:team_5_examapp/features/auth/register/data/models/user_dto.dart';
import 'package:team_5_examapp/features/auth/register/domain/use_cases/register_use_case.dart';

part 'register_state.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterState> {
  RegisterViewModel({required this.registerUseCase}) : super(RegisterState());

  final RegisterUseCase registerUseCase;

  Future<void> clearError() async {
    emit(state.copyWith(registerUserState: BaseState(isLoading: false)));
  }

  Future<void> registerUser({required UserDto userInfo}) async {
    emit(
      state.copyWith(
        registerUserState: state.registerUserState.copyWith(isLoading: true),
      ),
    );

    final response = await registerUseCase(userInfo: userInfo);
    switch (response) {
      case SuccessBaseResponse():
        emit(
          state.copyWith(
            registerUserState: state.registerUserState.copyWith(
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
            registerUserState: state.registerUserState.copyWith(
              isLoading: false,
              data: null,
              errorMessage: response.errorMessage,
            ),
          ),
        );

        break;
    }
  }
}
