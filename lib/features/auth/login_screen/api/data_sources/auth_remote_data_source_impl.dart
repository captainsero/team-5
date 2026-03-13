

import '../../data/data_sources/auth_remote_data_source_contract.dart';
import '../../data/models/user_dto.dart';
import '../auth_api_client/auth_api_client.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSourceContract {

  final AuthApiClient authApiClient;

  AuthRemoteDataSourceImpl(this.authApiClient);

  @override
  Future<UserDto> login(String email, String password) async {

    final response = await authApiClient.login(email, password);

    return UserDto.fromJson(response);
  }

}