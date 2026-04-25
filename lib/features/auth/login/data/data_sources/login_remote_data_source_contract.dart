import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/shared_models/auth_responses_shared_models/register_and_login_model_response/register_and_login_model_response.dart';

abstract interface class AuthRemoteDataSourceContract {
  Future<BaseResponse<RegisterAndLoginModelResponse>> login({
    required String email,
    required String password,
  });
}
