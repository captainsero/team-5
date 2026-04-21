import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/shared_models/auth_responses_shared_models/register_and_login_model_response/register_and_login_model_response.dart';
import 'package:team_5_examapp/features/profile/domain/repo/profile_repo_contract.dart';

@injectable
class GetProfileInfoUseCase {
  final ProfileRepoContract profileRepoContract;

  GetProfileInfoUseCase({required this.profileRepoContract});

  Future<BaseResponse<RegisterAndLoginModelResponse>> call({
    required String token,
  }) {
    return profileRepoContract.getProfileInfo(token: token);
  }
}
