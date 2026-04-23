import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/shared_models/auth_responses_shared_models/register_and_login_model_response/register_and_login_model_response.dart';
import 'package:team_5_examapp/features/auth/register/data/models/user_request_dto.dart';
import 'package:team_5_examapp/features/profile/data/data_sources/profile_remote_data_source_contract.dart';
import 'package:team_5_examapp/features/profile/domain/repo/profile_repo_contract.dart';

@Injectable(as: ProfileRepoContract)
class ProfileRepoImpl implements ProfileRepoContract {
  final ProfileRemoteDataSourceContract profileRemoteDataSourceContract;

  ProfileRepoImpl({required this.profileRemoteDataSourceContract});

  @override
  Future<BaseResponse<RegisterAndLoginModelResponse>> getProfileInfo({
    required String token,
  }) {
    return profileRemoteDataSourceContract.getProfileInfo(token: token);
  }

  @override
  Future<BaseResponse<RegisterAndLoginModelResponse>> updateProfileInfo({
    required String token,
    required UserRequestDto userRequestDto,
  }) {
    return profileRemoteDataSourceContract.updateProfileInfo(
      token: token,
      userRequestDto: userRequestDto,
    );
  }
}
