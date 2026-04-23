import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/shared_models/auth_responses_shared_models/register_and_login_model_response/register_and_login_model_response.dart';
import 'package:team_5_examapp/features/auth/register/data/models/user_request_dto.dart';
import 'package:team_5_examapp/features/profile/domain/repo/profile_repo_contract.dart';

class UpdateProfileInfoUseCase {
  ProfileRepoContract profileRepoContract;

  UpdateProfileInfoUseCase({required this.profileRepoContract});

  Future<BaseResponse<RegisterAndLoginModelResponse>> call({
    required String token,
    required UserRequestDto userRequestDto,
  }) {
    return profileRepoContract.updateProfileInfo(
      userRequestDto: userRequestDto,
      token: token,
    );
  }
}
