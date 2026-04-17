import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/auth/forget_password/data/models/requests/confirm_validation_code_request.dart';
import 'package:team_5_examapp/features/auth/forget_password/data/models/requests/forget_pass_request.dart';
import 'package:team_5_examapp/features/auth/forget_password/data/models/reset_pass_dto.dart';
import 'package:team_5_examapp/features/auth/forget_password/data/models/responses/forget_password_response.dart';

abstract class ForgetPassRemoteDataSourceContract {
  Future<BaseResponse<ForgetPasswordResponse>> forgetPassword({
    required ForgetPassRequest forgetPassReuest,
  });
  Future<BaseResponse<ForgetPasswordResponse>> confirmValidationCode({
    required ConfirmValidationCodeRequest confirmValidationCodeRequest,
  });
  Future<BaseResponse<ForgetPasswordResponse>> resetPassword({
    required ResetPassDto resetPassDto,
  });
}
