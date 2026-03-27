import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/auth/login/domain/models/user_model.dart';
import 'package:team_5_examapp/features/auth/login/domain/repo/login_repo_contract.dart';

@injectable
class LoginUseCase {
  final AuthRepoContract repo;

  LoginUseCase({required this.repo});

  Future<BaseResponse<UserModel>> call(String email, String password) {
    return repo.login(email, password);
  }
}
