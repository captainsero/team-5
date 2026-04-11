import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/auth/auth_shared_models/responses/auth_response.dart';
import 'package:team_5_examapp/features/auth/register/data/models/user_request_dto.dart';

abstract class RegisterRemoteSourceContract {
  Future<BaseResponse<AuthResponse>> register({
    required UserRequestDto userInfo,
  });
}
