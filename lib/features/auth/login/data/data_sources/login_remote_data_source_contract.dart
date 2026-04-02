import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/models/auth_responses_shared_models/auth_response/auth_response.dart';

abstract class AuthRemoteDataSourceContract {
  Future<BaseResponse<AuthResponse>> login({
    required String email,
    required String password,
  });
}
