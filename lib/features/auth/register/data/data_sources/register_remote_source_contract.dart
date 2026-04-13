import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/shared_models/auth_responses_shared_models/register_and_login_model_response/register_and_login_model_response.dart';
import 'package:team_5_examapp/features/auth/register/data/models/user_request_dto.dart';

abstract class RegisterRemoteSourceContract {
  Future<BaseResponse<RegisterAndLoginModelResponse>> register({
    required UserRequestDto userInfo,
  });
}
