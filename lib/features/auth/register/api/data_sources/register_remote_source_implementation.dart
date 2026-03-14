import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/auth/register/api/register_api_client/register_api_client.dart';
import 'package:team_5_examapp/features/auth/register/data/models/responses/register_response.dart';
import '../../data/data_sources/register_remote_source_contract.dart';

@Injectable(as: RegisterRemoteSourceContract)
class RegisterRemoteSourceImplementation
    implements RegisterRemoteSourceContract {
  RegisterRemoteSourceImplementation({required this.registerApiClient});
  RegisterApiClient registerApiClient;

  @override
  Future<BaseResponse<RegisterResponse>> register({
    required RegisterResponse registerResponse,
  }) async {
    try {
      final response = await registerApiClient.register(
        registerResponse: registerResponse.toJson(),
      );
      return SuccessBaseResponse<RegisterResponse>(data: response);
    } catch (e) {
      if (e is DioException) {
        final data = e.response?.data;
        final messageFromApi = (data is Map<String, dynamic>)
            ? data['message']?.toString()
            : null;
        return ErrorBaseResponse<RegisterResponse>(
          errorMessage:
              messageFromApi ??
              e.message ??
              "Something went wrong. Please try again later.",
        );
      } else if (e is TimeoutException) {
        return ErrorBaseResponse<RegisterResponse>(
          errorMessage: "Request timed out. Please try again later.",
        );
      }
      return ErrorBaseResponse<RegisterResponse>(
        errorMessage: "Something went wrong. Please try again later.",
      );
    }
  }
}
