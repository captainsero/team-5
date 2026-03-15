import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/auth/login_screen/domain/models/user_model.dart';

abstract class AuthRepoContract {
  Future<BaseResponse<UserModel>> login(String email, String password);
}



