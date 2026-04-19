import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/auth/login/domain/models/user_entity.dart';

abstract interface class AuthRepoContract {
  Future<BaseResponse<UserEntity>> login(String email, String password);
}
