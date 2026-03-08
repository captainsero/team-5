import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/auth/forget_password/data/models/reset_pass_dto.dart';

abstract class ForgetPassRemoteDataSourceContract {
  Future<BaseResponse<void>> forgetPassword({required String email});
  Future<BaseResponse<void>> confirmValidationCode({required String resetCode});
  Future<BaseResponse<void>> resetPassword({
    required ResetPassDto resetPassDto,
  });
}
