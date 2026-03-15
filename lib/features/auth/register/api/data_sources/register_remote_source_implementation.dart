import 'dart:async';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/auth/register/api/register_api_client/register_api_client.dart';
import 'package:team_5_examapp/features/auth/register/data/models/responses/register_response.dart';
import 'package:team_5_examapp/features/auth/register/data/models/user_dto.dart';
import '../../data/data_sources/register_remote_source_contract.dart';

@Injectable(as: RegisterRemoteSourceContract)
class RegisterRemoteSourceImplementation
    implements RegisterRemoteSourceContract {
  RegisterRemoteSourceImplementation({required this.registerApiClient});
  RegisterApiClient registerApiClient;

  @override
  Future<BaseResponse<AuthResponse>> register({
    required UserDto userInfo,
  }) async {
    try {
      final response = await registerApiClient.register(
        registerResponse: userInfo.toJson(),
      );
      print(" Sucess Ya RANA 🥰🥰Remote API Response: $response");
      return SuccessBaseResponse<AuthResponse>(data: response);
    } catch (e) {
      if (e is DioException) {
        final data = e.response?.data;
        final messageFromApi = (data is Map<String, dynamic>)
            ? data['message']?.toString()
            : null;
        return ErrorBaseResponse<AuthResponse>(
          errorMessage:
              messageFromApi ??
              e.message ??
              "Something went wrong. Please try again later.",
        );
      } else if (e is TimeoutException) {
        return ErrorBaseResponse<AuthResponse>(
          errorMessage: "Request timed out. Please try again later.",
        );
      }
      return ErrorBaseResponse<AuthResponse>(
        errorMessage: "Something went wrong. Please try again later.",
      );
    }
  }
}
