import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/auth/forget_password/api/forget_pass_api_client/forget_pass_api_client.dart';
import 'package:team_5_examapp/features/auth/forget_password/data/data_sources/forget_pass_remote_data_source_contract.dart';

@Injectable(as: ForgetPassRemoteDataSourceContract)
class ForgetPassRemoteDataSourceImpl
    implements ForgetPassRemoteDataSourceContract {
  ForgetPassRemoteDataSourceImpl({required this.forgetPassApiClient});
  final ForgetPassApiClient forgetPassApiClient;

  @override
  Future<BaseResponse<void>> forgetPassword(Map<String, dynamic> body) async {
    print("start");
    try {
      await forgetPassApiClient.forgetPassword();
      print("Success");
      return SucceessBaseResponse<void>(data: null);
    } catch (e) {
      print(e);
      if (e is DioException) {
        return ErrorBaseResponse<void>(
          errorMessage: e.message ?? "Dio Exception",
        );
      } else if (e is TimeoutException) {
        return ErrorBaseResponse<void>(
          errorMessage: "Request timed out. Please try again later.",
        );
      }

      return ErrorBaseResponse<void>(
        errorMessage: "Something went wrong. Please try again later.",
      );
    }
  }

  @override
  Future<BaseResponse<void>> confirmValidationCode() {
    // TODO: implement confirmValidationCode
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<void>> resetPassword() {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }
}
