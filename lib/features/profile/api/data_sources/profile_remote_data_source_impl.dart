import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/shared_models/user_response_dto.dart';
import 'package:team_5_examapp/features/auth/register/data/models/user_request_dto.dart';
import 'package:team_5_examapp/features/profile/api/profile_api_client/profile_api_client.dart';
import 'package:team_5_examapp/features/profile/data/data_sources/profile_remote_data_source_contract.dart';

@Injectable(as: ProfileRemoteDataSourceContract)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSourceContract {
  final ProfileApiClient profileApiClient;

  ProfileRemoteDataSourceImpl({required this.profileApiClient});

  @override
  Future<BaseResponse<UserResponseDto>> getProfileInfo({
    required String token,
  }) async {
    try {
      final response = await profileApiClient.getProfileInfo(token: token);
      return SuccessBaseResponse<UserResponseDto>(
        data: response.userResponseDto,
      );
    } catch (e) {
      return ErrorBaseResponse<UserResponseDto>(
        error: e,
        errorMessage: e.toString(),
      );
    }
  }

  @override
  Future<BaseResponse<UserResponseDto>> updateProfileInfo({
    required String token,
    required UserRequestDto userRequestDto,
  }) async {
    try {
      final response = await profileApiClient.updateProfileInfo(
        token: token,
        userRequestDto: userRequestDto,
      );
      return SuccessBaseResponse<UserResponseDto>(
        data: response.userResponseDto,
      );
    } catch (e) {
      return ErrorBaseResponse<UserResponseDto>(
        error: e,
        errorMessage: e.toString(),
      );
    }
  }
}
