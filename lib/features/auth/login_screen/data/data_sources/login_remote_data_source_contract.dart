
import 'package:team_5_examapp/features/auth/login_screen/data/models/responses/auth_response.dart';

abstract class AuthRemoteDataSourceContract {

  Future<AuthResponse> login(String email, String password);

}