import '../../../../../config/base_response/base_response.dart';
import '../../domain/models/user_model.dart';
import '../../domain/repo/auth_repo_contract.dart';
import '../data_sources/auth_remote_data_source_contract.dart';
import '../models/user_dto.dart';

class AuthRepoImpl implements AuthRepoContract {
  final AuthRemoteDataSourceContract remoteDataSource;

  AuthRepoImpl({required this.remoteDataSource});

  @override
  Future<BaseResponse<UserModel>> login(String email, String password) async {
    try {
      final dto = await remoteDataSource.login(email, password);
      return SucceessBaseResponse(data: dto.toDomain());
    } catch (e) {
      return ErrorBaseResponse(errorMessage: e.toString());
    }
  }
}