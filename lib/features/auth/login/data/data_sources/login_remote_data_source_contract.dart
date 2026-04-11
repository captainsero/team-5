import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/auth/auth_shared_models/responses/auth_response.dart';

abstract class AuthRemoteDataSourceContract {
  Future<BaseResponse<AuthResponse>> login({
    required String email,
    required String password,
  });
}
