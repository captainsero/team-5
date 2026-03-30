import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/secure_storage/secure_storage_keys.dart';
import 'package:team_5_examapp/config/secure_storage/secure_storage_service.dart';
import 'package:team_5_examapp/config/shared_models/auth_responses_shared_models/auth_response/auth_response.dart';
import 'package:team_5_examapp/features/auth/login/data/data_sources/login_remote_data_source_contract.dart';
import 'package:team_5_examapp/features/auth/login/domain/models/user_model.dart';
import 'package:team_5_examapp/features/auth/login/domain/repo/login_repo_contract.dart';

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

        final token = response.data.token;

        if (token != null) {
          await SecureStorageService.write(
            key: SecureStorageKeys.userToken,
            value: token,
          );
        }

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
