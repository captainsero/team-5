import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:team_5_examapp/config/shared_models/auth_responses_shared_models/register_and_login_model_response/register_and_login_model_response.dart';
import 'package:team_5_examapp/core/constants/app_end_points.dart';

part 'profile_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class ProfileApiClient {
  @factoryMethod
  factory ProfileApiClient(Dio dio) = _ProfileApiClient;

  @GET(AppEndPoints.getLoggedUserInfo)
  Future<RegisterAndLoginModelResponse> getProfileInfo({
    @Header("token") required String token,
  });
}
