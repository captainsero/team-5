import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/models/auth_responses_shared_models/auth_response/auth_response.dart';
import 'package:team_5_examapp/features/auth/login/api/auth_api_client/login_api_client.dart';
import 'package:team_5_examapp/features/auth/login/data/data_sources/login_remote_data_source_contract.dart';
import 'package:team_5_examapp/features/auth/login/data/models/login_request_model.dart';

@Injectable(as: AuthRemoteDataSourceContract)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSourceContract {
  final AuthApiClient authApiClient;

  AuthRemoteDataSourceImpl(this.authApiClient);

  @override
  Future<BaseResponse<AuthResponse>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await authApiClient.login(
        loginBody: LoginRequestModel(email: email, password: password).toJson(),
      );
      return SuccessBaseResponse<AuthResponse>(data: response);
    } catch (e) {
      return ErrorBaseResponse<AuthResponse>(error: e);
    }
  }
}
