
import 'package:team_5_examapp/features/auth/login_screen/data/models/user_dto.dart';

abstract class AuthRemoteDataSourceContract {

  Future<UserDto> login(String email, String password);

}