import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/auth/register/data/data_sources/register_remote_source_contract.dart';
import 'package:team_5_examapp/features/auth/register/data/models/user_request_dto.dart';
import '../../domain/repo/register_repo_contract.dart';
import '../../../auth_shared_models/responses/register_response.dart';

@Injectable(as: RegisterRepoContract)
class RegisterRepoImplementation implements RegisterRepoContract {
  final RegisterRemoteSourceContract registerRemoteSourceContract;

  RegisterRepoImplementation({required this.registerRemoteSourceContract});

  @override
  Future<BaseResponse<AuthResponse>> register({
    required UserDto userInfo,
  }) async {
    final response = await registerRemoteSourceContract.register(
      userInfo: userInfo,
    );
    return response;
  }
}
