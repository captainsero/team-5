import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/shared_models/auth_responses_shared_models/auth_response/auth_response.dart';
import 'package:team_5_examapp/features/auth/register/data/models/user_request_dto.dart';
import '../../../../../config/base_response/base_response.dart';
import '../repo/register_repo_contract.dart';

@injectable
class RegisterUseCase {
  final RegisterRepoContract registerRepoContract;

  RegisterUseCase({required this.registerRepoContract});

  Future<BaseResponse<AuthResponse>> call({
    required UserRequestDto userInfo,
  }) async {
    return registerRepoContract.register(userInfo: userInfo);
  }
}
