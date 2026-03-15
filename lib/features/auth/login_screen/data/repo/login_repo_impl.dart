import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/auth/login_screen/data/data_sources/login_remote_data_source_contract.dart';
import 'package:team_5_examapp/features/auth/login_screen/domain/models/user_model.dart';
import 'package:team_5_examapp/features/auth/login_screen/domain/repo/login_repo_contract.dart';

@Injectable(as: AuthRepoContract)
class AuthRepoImpl implements AuthRepoContract {
  final AuthRemoteDataSourceContract remoteDataSource;

  AuthRepoImpl({required this.remoteDataSource});

  @override
  Future<BaseResponse<UserModel>> login(String email, String password) async {
    try {
      final dto = await remoteDataSource.login(email, password);
      return SuccessBaseResponse<UserModel>(data: dto.toDomain());
    } catch (e) {
      String message = "Something went wrong";

      if (e is DioException) {
        message = e.error?.toString() ?? e.message ?? message;
      } else {
        message = e.toString();
      }

      return ErrorBaseResponse<UserModel>(errorMessage: message);
    }
  }
}
