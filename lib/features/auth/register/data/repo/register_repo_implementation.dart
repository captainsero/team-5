import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/auth/register/data/data_sources/register_remote_source_contract.dart';
import '../../domain/repo/register_repo_contract.dart';
import '../models/responses/register_response.dart';

@Injectable(as: RegisterRepoContract)
class RegisterRepoImplementation implements RegisterRepoContract {
  final RegisterRemoteSourceContract registerRemoteSourceContract;

  RegisterRepoImplementation({required this.registerRemoteSourceContract});

  @override
  Future<BaseResponse<RegisterResponse>> register({
    required RegisterResponse registerResponse,
  }) async {
    final response = await registerRemoteSourceContract.register(
      registerResponse: registerResponse,
    );
    switch (response) {
      case SuccessBaseResponse<RegisterResponse>():
        return SuccessBaseResponse(data: response.data);
      case ErrorBaseResponse<RegisterResponse>():
        return ErrorBaseResponse(errorMessage: response.errorMessage);
    }
  }
}
