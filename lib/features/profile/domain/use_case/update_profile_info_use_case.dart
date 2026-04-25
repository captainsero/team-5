import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/auth/login/domain/models/user_entity.dart';
import 'package:team_5_examapp/features/profile/domain/repo/profile_repo_contract.dart';
@injectable
class UpdateProfileInfoUseCase {
  ProfileRepoContract profileRepoContract;

  UpdateProfileInfoUseCase({required this.profileRepoContract});

  Future<BaseResponse<UserEntity>> call({
    required String token,
    required UserEntity userEntity,
  }) {
    return profileRepoContract.updateProfileInfo(
      userEntity: userEntity,
      token: token,
    );
  }
}
