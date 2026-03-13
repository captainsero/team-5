import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../config/base_state/base_state.dart';
import '../../../domain/models/user_model.dart';
import '../../../domain/use_cases/login_use_cases.dart';
import '../../../../../../config/base_response/base_response.dart';

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