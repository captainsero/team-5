import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/auth/forget_password/data/data_sources/forget_pass_remote_data_source_contract.dart';
import 'package:team_5_examapp/features/auth/forget_password/data/models/reset_pass_dto.dart';
import 'package:team_5_examapp/features/auth/forget_password/domain/repo/forget_pass_repo_contract.dart';

@Injectable(as: ForgetPassRepoContract)
class ForgetPassRepoImpl implements ForgetPassRepoContract {
  final ForgetPassRemoteDataSourceContract forgetPassRemoteDataSourceContract;

  ForgetPassRepoImpl({required this.forgetPassRemoteDataSourceContract});

  @override
  Future<BaseResponse<void>> forgetPassword({required String email}) async {
    final response = await forgetPassRemoteDataSourceContract.forgetPassword(
      email: email,
    );
    switch (response) {
      case SucceessBaseResponse<void>():
        return SucceessBaseResponse<void>(data: null);
      case ErrorBaseResponse<void>():
        return ErrorBaseResponse<void>(errorMessage: response.errorMessage);
    }
  }

  @override
  Future<BaseResponse<void>> confirmValidationCode({
    required String resetCode,
  }) async {
    final response = await forgetPassRemoteDataSourceContract
        .confirmValidationCode(resetCode: resetCode);
    switch (response) {
      case SucceessBaseResponse<void>():
        return SucceessBaseResponse<void>(data: null);
      case ErrorBaseResponse<void>():
        return ErrorBaseResponse<void>(errorMessage: response.errorMessage);
    }
  }

  @override
  Future<BaseResponse<void>> resetPassword({
    required ResetPassDto resetPassDto,
  }) async {
    final response = await forgetPassRemoteDataSourceContract.resetPassword(
      resetPassDto: resetPassDto,
    );
    switch (response) {
      case SucceessBaseResponse<void>():
        return SucceessBaseResponse<void>(data: null);
      case ErrorBaseResponse<void>():
        return ErrorBaseResponse<void>(errorMessage: response.errorMessage);
    }
  }
}
