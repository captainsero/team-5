import 'package:team_5_examapp/config/base_response/base_response.dart';

abstract class ForgetPassRemoteDataSourceContract {
  Future<BaseResponse<bool>> forgetPass();
  Future<BaseResponse<bool>> confirmValidationCode();
  Future<BaseResponse<bool>> resetPassword();
}
