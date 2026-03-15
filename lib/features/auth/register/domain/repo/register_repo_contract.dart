import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/auth/register/data/models/responses/register_response.dart';
import 'package:team_5_examapp/features/auth/register/data/models/user_dto.dart';

abstract class RegisterRepoContract {
  Future<BaseResponse<AuthResponse>> register({required UserDto userInfo});
}
