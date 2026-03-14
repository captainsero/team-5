import 'dart:async';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/features/auth/login_screen/api/auth_api_client/login_api_client.dart';
import 'package:team_5_examapp/features/auth/login_screen/data/data_sources/login_remote_data_source_contract.dart';
import 'package:team_5_examapp/features/auth/login_screen/data/models/responses/auth_response.dart';

@Injectable(as: AuthRemoteDataSourceContract)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSourceContract {
  final AuthApiClient authApiClient;

  AuthRemoteDataSourceImpl(this.authApiClient);

  @override
  Future<AuthResponse> login(String email, String password) async {
    try {
      final response = await authApiClient.login({
        "email": email,
        "password": password,
      });
      return response;
    } catch (e) {
      if (e is DioException) {
        final data = e.response?.data;
        final messageFromApi = (data is Map<String, dynamic>)
            ? data['message']?.toString()
            : null;
        throw DioException(
          requestOptions: e.requestOptions,
          error: messageFromApi ?? e.message ?? "Something went wrong.",
        );
      } else if (e is TimeoutException) {
        throw TimeoutException("Request timed out. Please try again later.");
      }

      throw Exception("Something went wrong. Please try again later.");
    }
  }
}
