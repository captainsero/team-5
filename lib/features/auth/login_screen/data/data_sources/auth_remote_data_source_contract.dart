import '../models/user_dto.dart';

abstract class AuthRemoteDataSourceContract {

  Future<UserDto> login(String email, String password);

}