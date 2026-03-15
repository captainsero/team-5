import 'dart:async';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/auth/forget_password/api/forget_pass_api_client/forget_pass_api_client.dart';
import 'package:team_5_examapp/features/auth/forget_password/data/data_sources/forget_pass_remote_data_source_contract.dart';
import 'package:team_5_examapp/features/auth/forget_password/data/models/reset_pass_dto.dart';
import 'package:team_5_examapp/features/auth/forget_password/data/models/responses/forget_password_response.dart';

@Injectable(as: ForgetPassRemoteDataSourceContract)
class ForgetPassRemoteDataSourceImpl
    implements ForgetPassRemoteDataSourceContract {
  ForgetPassRemoteDataSourceImpl({required this.forgetPassApiClient});
  final ForgetPassApiClient forgetPassApiClient;

  @override
  Future<BaseResponse<ForgetPasswordResponse>> forgetPassword({
    required String email,
  }) async {
    try {
      final response = await forgetPassApiClient.forgetPassword(email: email);
      return SuccessBaseResponse<ForgetPasswordResponse>(data: response);
    } catch (e) {
      if (e is DioException) {
        final data = e.response?.data;
        final messageFromApi = (data is Map<String, dynamic>)
            ? data['message']?.toString()
            : null;
        return ErrorBaseResponse<ForgetPasswordResponse>(
          errorMessage:
              messageFromApi ??
              e.message ??
              "Something went wrong. Please try again later.",
        );
      } else if (e is TimeoutException) {
        return ErrorBaseResponse<ForgetPasswordResponse>(
          errorMessage: "Request timed out. Please try again later.",
        );
      }

      return ErrorBaseResponse<ForgetPasswordResponse>(
        errorMessage: "Something went wrong. Please try again later.",
      );
    }
  }

  @override
  Future<BaseResponse<ForgetPasswordResponse>> confirmValidationCode({
    required String resetCode,
  }) async {
    try {
      final response = await forgetPassApiClient.confirmValidationCode(
        resetCode: resetCode,
      );
      return SuccessBaseResponse(data: response);
    } catch (e) {
      if (e is DioException) {
        final data = e.response?.data;
        final messageFromApi = (data is Map<String, dynamic>)
            ? data['message']?.toString()
            : null;
        return ErrorBaseResponse<ForgetPasswordResponse>(
          errorMessage:
              messageFromApi ??
              e.message ??
              "Something went wrong. Please try again later.",
        );
      } else if (e is TimeoutException) {
        return ErrorBaseResponse<ForgetPasswordResponse>(
          errorMessage: "Request timed out. Please try again later.",
        );
      }

      return ErrorBaseResponse<ForgetPasswordResponse>(
        errorMessage: "Something went wrong. Please try again later.",
      );
    }
  }

  @override
  Future<BaseResponse<ForgetPasswordResponse>> resetPassword({
    required ResetPassDto resetPassDto,
  }) async {
    try {
      final response = await forgetPassApiClient.resetPassword(
        resetPassDto: resetPassDto.toJson(),
      );
      return SuccessBaseResponse<ForgetPasswordResponse>(data: response);
    } catch (e) {
      if (e is DioException) {
        final data = e.response?.data;
        final messageFromApi = (data is Map<String, dynamic>)
            ? data['message']?.toString()
            : null;
        return ErrorBaseResponse<ForgetPasswordResponse>(
          errorMessage:
              messageFromApi ??
              e.message ??
              "Something went wrong. Please try again later.",
        );
      } else if (e is TimeoutException) {
        return ErrorBaseResponse<ForgetPasswordResponse>(
          errorMessage: "Request timed out. Please try again later.",
        );
      }
      return ErrorBaseResponse<ForgetPasswordResponse>(
        errorMessage: "Something went wrong. Please try again later.",
      );
    }
  }
}
