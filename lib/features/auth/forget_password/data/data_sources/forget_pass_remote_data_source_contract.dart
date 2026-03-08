import 'package:team_5_examapp/config/base_response/base_response.dart';

abstract class ForgetPassRemoteDataSourceContract {
  Future<BaseResponse<void>> forgetPassword({required String email});
  Future<BaseResponse<void>> confirmValidationCode({required String resetCode});
  Future<BaseResponse<void>> resetPassword();
}
