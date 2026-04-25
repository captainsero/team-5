import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/auth/login/domain/models/user_entity.dart';
import 'package:team_5_examapp/features/profile/domain/repo/profile_repo_contract.dart';

@injectable
class GetProfileInfoUseCase {
  final ProfileRepoContract profileRepoContract;

  GetProfileInfoUseCase({required this.profileRepoContract});

  Future<BaseResponse<UserEntity>> call({required String token}) {
    return profileRepoContract.getProfileInfo(token: token);
  }
}
