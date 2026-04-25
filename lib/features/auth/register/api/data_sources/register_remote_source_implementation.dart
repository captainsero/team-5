import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/shared_models/auth_responses_shared_models/register_and_login_model_response/register_and_login_model_response.dart';
import 'package:team_5_examapp/features/auth/register/api/register_api_client/register_api_client.dart';
import 'package:team_5_examapp/features/auth/register/data/data_sources/register_remote_source_contract.dart';
import 'package:team_5_examapp/features/auth/register/data/models/user_request_dto.dart';

@Injectable(as: RegisterRemoteSourceContract)
class RegisterRemoteSourceImplementation
    implements RegisterRemoteSourceContract {
  RegisterRemoteSourceImplementation({required this.registerApiClient});
  RegisterApiClient registerApiClient;

  @override
  Future<BaseResponse<RegisterAndLoginModelResponse>> register({
    required UserRequestDto userInfo,
  }) async {
    try {
      final response = await registerApiClient.register(
        registerResponse: userInfo.toJson(),
      );
      return SuccessBaseResponse<RegisterAndLoginModelResponse>(data: response);
    } catch (e) {
      return ErrorBaseResponse<RegisterAndLoginModelResponse>(error: e);
    }
  }
}
