import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/auth/forget_password/data/data_sources/forget_pass_remote_data_source_contract.dart';
import 'package:team_5_examapp/features/auth/forget_password/data/models/reset_pass_dto.dart';
import 'package:team_5_examapp/features/auth/forget_password/data/models/responses/forget_password_response.dart';
import 'package:team_5_examapp/features/auth/forget_password/domain/repo/forget_pass_repo_contract.dart';

@Injectable(as: ForgetPassRepoContract)
class ForgetPassRepoImpl implements ForgetPassRepoContract {
  final ForgetPassRemoteDataSourceContract forgetPassRemoteDataSourceContract;

  ForgetPassRepoImpl({required this.forgetPassRemoteDataSourceContract});

  @override
  Future<BaseResponse<ForgetPasswordResponse>> forgetPassword({
    required String email,
  }) async {
    final response = await forgetPassRemoteDataSourceContract.forgetPassword(
      email: email,
    );
    switch (response) {
      case SuccessBaseResponse<ForgetPasswordResponse>():
        return SuccessBaseResponse<ForgetPasswordResponse>(
          data: response.data,
        );
      case ErrorBaseResponse<ForgetPasswordResponse>():
        return ErrorBaseResponse<ForgetPasswordResponse>(
          errorMessage: response.errorMessage,
        );
    }
  }

  @override
  Future<BaseResponse<ForgetPasswordResponse>> confirmValidationCode({
    required String resetCode,
  }) async {
    final response = await forgetPassRemoteDataSourceContract
        .confirmValidationCode(resetCode: resetCode);
    switch (response) {
      case SuccessBaseResponse<ForgetPasswordResponse>():
        return SuccessBaseResponse<ForgetPasswordResponse>(
          data: response.data,
        );
      case ErrorBaseResponse<ForgetPasswordResponse>():
        return ErrorBaseResponse<ForgetPasswordResponse>(
          errorMessage: response.errorMessage,
        );
    }
  }

  @override
  Future<BaseResponse<ForgetPasswordResponse>> resetPassword({
    required ResetPassDto resetPassDto,
  }) async {
    final response = await forgetPassRemoteDataSourceContract.resetPassword(
      resetPassDto: resetPassDto,
    );
    switch (response) {
      case SuccessBaseResponse<ForgetPasswordResponse>():
        return SuccessBaseResponse<ForgetPasswordResponse>(
          data: response.data,
        );
      case ErrorBaseResponse<ForgetPasswordResponse>():
        return ErrorBaseResponse<ForgetPasswordResponse>(
          errorMessage: response.errorMessage,
        );
    }
  }
}
