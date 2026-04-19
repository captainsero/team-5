import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/shared_models/auth_responses_shared_models/register_and_login_model_response/register_and_login_model_response.dart';
import 'package:team_5_examapp/features/auth/login/api/login_api_client/login_api_client.dart';
import 'package:team_5_examapp/features/auth/login/data/data_sources/login_remote_data_source_contract.dart';
import 'package:team_5_examapp/features/auth/login/data/models/login_request_model.dart';

@Injectable(as: AuthRemoteDataSourceContract)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSourceContract {
  final LoginApiClient authApiClient;

  AuthRemoteDataSourceImpl(this.authApiClient);

  @override
  Future<BaseResponse<RegisterAndLoginModelResponse>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await authApiClient.login(
        loginBody: LoginRequestModel(email: email, password: password).toJson(),
      );
      return SuccessBaseResponse<RegisterAndLoginModelResponse>(data: response);
    } catch (e) {
      return ErrorBaseResponse<RegisterAndLoginModelResponse>(
        error: e,
        errorMessage: e.toString(),
      );
    }
  }
}
