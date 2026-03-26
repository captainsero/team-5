import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/auth/register/data/models/responses/register_response.dart';

abstract class AuthRemoteDataSourceContract {
  Future<BaseResponse<AuthResponse>> login({
    required String email,
    required String password,
  });
}
