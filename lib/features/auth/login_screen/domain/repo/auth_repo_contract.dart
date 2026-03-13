import '../../../../../config/base_response/base_response.dart';
import '../models/user_model.dart';

abstract class AuthRepoContract {
  Future<BaseResponse<UserModel>> login(String email, String password);
}



