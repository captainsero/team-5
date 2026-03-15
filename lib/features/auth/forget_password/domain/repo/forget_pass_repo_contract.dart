import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/auth/forget_password/data/models/reset_pass_dto.dart';
import 'package:team_5_examapp/features/auth/forget_password/data/models/responses/forget_password_response.dart';

abstract class ForgetPassRepoContract {
  Future<BaseResponse<ForgetPasswordResponse>> forgetPassword({required String email});
  Future<BaseResponse<ForgetPasswordResponse>> confirmValidationCode({required String resetCode});
  Future<BaseResponse<ForgetPasswordResponse>> resetPassword({
    required ResetPassDto resetPassDto,
  });
}
