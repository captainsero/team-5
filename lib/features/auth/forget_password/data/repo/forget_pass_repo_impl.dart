import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/response_handler/secure_storage_handler.dart';
import 'package:team_5_examapp/config/secure_storage/secure_storage_keys.dart';
import 'package:team_5_examapp/config/secure_storage/secure_storage_service.dart';
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
    return await forgetPassRemoteDataSourceContract.forgetPassword(
      email: email,
    );
  }

  @override
  Future<BaseResponse<ForgetPasswordResponse>> confirmValidationCode({
    required String resetCode,
  }) async {
    return await forgetPassRemoteDataSourceContract.confirmValidationCode(
      resetCode: resetCode,
    );
  }

  @override
  Future<BaseResponse<ForgetPasswordResponse>> resetPassword({
    required ResetPassDto resetPassDto,
  }) async {
    final emailResponse = await SecureStorageService.read(
      key: SecureStorageKeys.userEmail,
    );
    final storageHandler = SecureStorageHandler.handle(emailResponse);
    resetPassDto.email = storageHandler.data ?? '';
    return await forgetPassRemoteDataSourceContract.resetPassword(
      resetPassDto: resetPassDto,
    );
  }
}
