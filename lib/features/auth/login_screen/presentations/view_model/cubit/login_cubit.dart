import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/base_state/base_state.dart';
import 'package:team_5_examapp/features/auth/login_screen/domain/models/user_model.dart';
import 'package:team_5_examapp/features/auth/login_screen/domain/use_cases/login_use_cases.dart';


@injectable
class LoginViewModel extends Cubit<BaseState<UserModel>> {
  final LoginUseCase loginUseCase;

  LoginViewModel({required this.loginUseCase})
      : super(BaseState<UserModel>());

  Future<void> login(String email, String password) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final BaseResponse<UserModel> response =
    await loginUseCase(email, password);

    if (response is SucceessBaseResponse<UserModel>) {
      emit(state.copyWith(isLoading: false, data: response.data));
    } else if (response is ErrorBaseResponse<UserModel>) {
      emit(state.copyWith(isLoading: false, errorMessage: response.errorMessage));
    }
  }
}