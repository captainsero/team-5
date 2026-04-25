import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/auth/login/domain/models/user_entity.dart';

abstract interface class ProfileRepoContract {
  Future<BaseResponse<UserEntity>> getProfileInfo({required String token});
  Future<BaseResponse<UserEntity>> updateProfileInfo({
    required String token,
    required UserEntity userEntity,
  });
}
