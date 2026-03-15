import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/features/auth/register/data/models/responses/register_response.dart';
import 'package:team_5_examapp/features/auth/register/data/models/user_dto.dart';
import '../../../../../config/base_response/base_response.dart';
import '../repo/register_repo_contract.dart';

@injectable
class RegisterUseCase {
  final RegisterRepoContract registerRepoContract;

  RegisterUseCase({required this.registerRepoContract});

  Future<BaseResponse<AuthResponse>> call({required UserDto userInfo}) async {
    print("go to useCase ya RANA🥰🥰");

    return registerRepoContract.register(userInfo: userInfo);
  }
}
