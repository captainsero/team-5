import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/shared_models/auth_responses_shared_models/register_and_login_model_response/register_and_login_model_response.dart';
import 'package:team_5_examapp/features/profile/api/profile_api_client/profile_api_client.dart';
import 'package:team_5_examapp/features/profile/data/data_sources/profile_remote_data_source_contract.dart';

@Injectable(as: ProfileRemoteDataSourceContract)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSourceContract {
  final ProfileApiClient profileApiClient;

  ProfileRemoteDataSourceImpl({required this.profileApiClient});

  @override
  Future<BaseResponse<RegisterAndLoginModelResponse>> getProfileInfo({
    required String token,
  }) async {
    try {
      final response = profileApiClient.getProfileInfo(token: token);
      return SuccessBaseResponse<RegisterAndLoginModelResponse>(
        data: await response,
      );
    } catch (e) {
      return ErrorBaseResponse<RegisterAndLoginModelResponse>(
        error: e,
        errorMessage: e.toString(),
      );
    }
  }
}
