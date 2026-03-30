import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/secure_storage/secure_storage_keys.dart';
import 'package:team_5_examapp/config/secure_storage/secure_storage_service.dart';
import 'package:team_5_examapp/features/auth/login/data/data_sources/login_remote_data_source_contract.dart';
import 'package:team_5_examapp/features/auth/login/domain/models/user_model.dart';
import 'package:team_5_examapp/features/auth/login/domain/repo/login_repo_contract.dart';
import 'package:team_5_examapp/features/auth/auth_shared_models/responses/register_response.dart';

@Injectable(as: AuthRepoContract)
class AuthRepoImpl implements AuthRepoContract {
  final AuthRemoteDataSourceContract remoteDataSource;

  AuthRepoImpl({required this.remoteDataSource});

  @override
  Future<BaseResponse<UserModel>> login(String email, String password) async {
    final response = await remoteDataSource.login(
      email: email,
      password: password,
    );

    switch (response) {
      case SuccessBaseResponse<AuthResponse>():

        // Save token
        SecureStorageService.write(
          key: SecureStorageKeys.userToken,
          value: response.data.token,
        );

        // Map to User domain model
        final user = UserModel.fromAuthResponse(response.data);

        return SuccessBaseResponse<UserModel>(data: user);

      case ErrorBaseResponse<AuthResponse>():
        return ErrorBaseResponse<UserModel>(
          errorMessage: response.errorMessage,
        );
    }
  }
}
