import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/shared_models/user_response_dto.dart';
import 'package:team_5_examapp/features/auth/login/domain/models/user_entity.dart';
import 'package:team_5_examapp/features/profile/data/data_sources/profile_remote_data_source_contract.dart';
import 'package:team_5_examapp/features/profile/domain/repo/profile_repo_contract.dart';

@Injectable(as: ProfileRepoContract)
class ProfileRepoImpl implements ProfileRepoContract {
  final ProfileRemoteDataSourceContract profileRemoteDataSourceContract;

  ProfileRepoImpl({required this.profileRemoteDataSourceContract});

  @override
  Future<BaseResponse<UserEntity>> getProfileInfo({
    required String token,
  }) async {
    final response = await profileRemoteDataSourceContract.getProfileInfo(
      token: token,
    );
    switch (response) {
      case SuccessBaseResponse<UserResponseDto>():
        return SuccessBaseResponse<UserEntity>(data: response.data.toDomain());
      case ErrorBaseResponse<UserResponseDto>():
        return ErrorBaseResponse<UserEntity>(
          error: response.error,
          errorMessage: response.errorMessage,
        );
    }
  }

  @override
  Future<BaseResponse<UserEntity>> updateProfileInfo({
    required String token,
    required UserEntity userEntity,
  }) async {
    final response = await profileRemoteDataSourceContract.updateProfileInfo(
      token: token,
      userRequestDto: userEntity.toRequestDto(),
    );

    switch (response) {
      case SuccessBaseResponse<UserResponseDto>():
        return SuccessBaseResponse<UserEntity>(data: response.data.toDomain());
      case ErrorBaseResponse<UserResponseDto>():
        return ErrorBaseResponse<UserEntity>(
          error: response.error,
          errorMessage: response.errorMessage,
        );
    }
  }
}
