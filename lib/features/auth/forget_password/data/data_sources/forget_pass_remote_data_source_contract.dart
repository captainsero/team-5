import 'package:team_5_examapp/config/base_response/base_response.dart';

abstract class ForgetPassRemoteDataSourceContract {
  Future<BaseResponse<void>> forgetPassword(Map<String, dynamic> body);
  Future<BaseResponse<void>> confirmValidationCode();
  Future<BaseResponse<void>> resetPassword();
}
