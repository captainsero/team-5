import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/auth/forget_password/data/data_sources/forget_pass_remote_data_source_contract.dart';

class ForgetPassRemoteDataSourceImpl
    implements ForgetPassRemoteDataSourceContract {
  @override
  Future<BaseResponse<bool>> confirmValidationCode() {
    // TODO: implement confirmValidationCode
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<bool>> forgetPass() {
    // TODO: implement forgetPass
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<bool>> resetPassword() {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }}
