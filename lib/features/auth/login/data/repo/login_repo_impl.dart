import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/secure_storage/secure_storage_keys.dart';
import 'package:team_5_examapp/config/secure_storage/secure_storage_service.dart';
import 'package:team_5_examapp/config/shared_models/auth_responses_shared_models/register_and_login_model_response/register_and_login_model_response.dart';
import 'package:team_5_examapp/features/auth/login/data/data_sources/login_remote_data_source_contract.dart';
import 'package:team_5_examapp/features/auth/login/domain/models/user_entity.dart';
import 'package:team_5_examapp/features/auth/login/domain/repo/login_repo_contract.dart';

@Injectable(as: AuthRepoContract)
class AuthRepoImpl implements AuthRepoContract {
  final AuthRemoteDataSourceContract remoteDataSource;

  AuthRepoImpl({required this.remoteDataSource});

  @override
  Future<BaseResponse<UserEntity>> login(String email, String password) async {
    final response = await remoteDataSource.login(
      email: email,
      password: password,
    );

    switch (response) {
      case SuccessBaseResponse<RegisterAndLoginModelResponse>():

        // Save token
        if (response.data.token != null && response.data.token!.isNotEmpty) {
          await SecureStorageService.write(
            key: SecureStorageKeys.userToken,
            value: response.data.token!,
          );
        }

        // Map to User domain model

        return SuccessBaseResponse<UserEntity>(
          data: response.data.toEntity(response.data),
        );

      case ErrorBaseResponse<RegisterAndLoginModelResponse>():
        return ErrorBaseResponse<UserEntity>(
          errorMessage: response.errorMessage,
        );
    }
  }

  @override
  Future<String?> getSavedEmail() async {
    final loadedToken = await SecureStorageService.read(
      key: SecureStorageKeys.userEmail,
    );
    if (loadedToken is SuccessBaseResponse<String>) {
      return loadedToken.data;
    }
    return null;
  }
}
