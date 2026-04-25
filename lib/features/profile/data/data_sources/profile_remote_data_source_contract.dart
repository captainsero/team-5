import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/shared_models/auth_responses_shared_models/user_response_dto.dart';
import 'package:team_5_examapp/features/auth/register/data/models/user_request_dto.dart';

abstract interface class ProfileRemoteDataSourceContract {
  Future<BaseResponse<UserResponseDto>> getProfileInfo({required String token});
  Future<BaseResponse<UserResponseDto>> updateProfileInfo({
    required String token,
    required UserRequestDto userRequestDto,
  });
}
