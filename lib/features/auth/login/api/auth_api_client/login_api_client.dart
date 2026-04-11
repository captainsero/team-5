import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:team_5_examapp/core/constants/app_end_points.dart';
import 'package:team_5_examapp/features/auth/auth_shared_models/responses/auth_response.dart';

part 'login_api_client.g.dart';

@RestApi()
@injectable
abstract class AuthApiClient {
  @factoryMethod
  factory AuthApiClient(Dio dio) = _AuthApiClient;
  @POST(AppEndPoints.signin)
  Future<AuthResponse> login({@Body() required Map<String, dynamic> loginBody});
}
