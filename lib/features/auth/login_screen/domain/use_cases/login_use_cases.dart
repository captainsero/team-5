import '../../../../../config/base_response/base_response.dart';
import '../models/user_model.dart';
import '../repo/auth_repo_contract.dart';

class LoginUseCase {
  final AuthRepoContract repo;

  LoginUseCase({required this.repo});

  Future<BaseResponse<UserModel>> call(String email, String password) {
    return repo.login(email, password);
  }
}