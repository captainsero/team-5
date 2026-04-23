import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:team_5_examapp/config/base_state/base_state.dart';
import 'package:team_5_examapp/config/response_handler/response_handler.dart';
import 'package:team_5_examapp/config/shared_models/auth_responses_shared_models/register_and_login_model_response/register_and_login_model_response.dart';
import 'package:team_5_examapp/features/auth/register/data/models/user_request_dto.dart';
import 'package:team_5_examapp/features/profile/domain/use_case/get_profile_info_use_case.dart';
import 'package:team_5_examapp/features/profile/domain/use_case/update_profile_info.dart';

part 'profile_state.dart';

class ProfileViewModel extends Cubit<ProfileState> {
  GetProfileInfoUseCase getProfileInfoUseCase;
  UpdateProfileInfoUseCase updateProfileInfoUseCase;
  ProfileViewModel(
    super.initialState, {
    required this.getProfileInfoUseCase,
    required this.updateProfileInfoUseCase,
  });

  Future<void> getProfileInfo({required String token}) async {
    final response = await getProfileInfoUseCase.call(token: token);
    final responseHandler = ResponseHandler.handle(response);

    emit(
      state.copyWith(
        profileState: state.profileState.copyWith(
          isLoading: responseHandler.isLoading,
          data: responseHandler.data,
          errorMessage: responseHandler.errorMessage,
        ),
      ),
    );
  }

  Future<void> updateProfileInfo({
    required String token,
    required UserRequestDto userRequestDto,
  }) async {
    final response = await updateProfileInfoUseCase.call(
      token: token,
      userRequestDto: userRequestDto,
    );
    final responseHandler = ResponseHandler.handle(response);
    emit(
      state.copyWith(
        profileState: state.profileState.copyWith(
          isLoading: responseHandler.isLoading,
          data: responseHandler.data,
          errorMessage: responseHandler.errorMessage,
        ),
      ),
    );
  }
}
