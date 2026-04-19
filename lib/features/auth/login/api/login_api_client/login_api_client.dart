import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:team_5_examapp/config/shared_models/auth_responses_shared_models/register_and_login_model_response/register_and_login_model_response.dart';
import 'package:team_5_examapp/core/constants/app_end_points.dart';
part 'login_api_client.g.dart';

@RestApi()
@lazySingleton
abstract class LoginApiClient {
  @factoryMethod
  factory LoginApiClient(Dio dio) = _LoginApiClient;

  @POST(AppEndPoints.signin)
  Future<RegisterAndLoginModelResponse> login({
    @Body() required Map<String, dynamic> loginBody,
  });
}
