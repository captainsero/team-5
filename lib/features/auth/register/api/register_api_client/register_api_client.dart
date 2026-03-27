import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/ِapp_endpoints/app_endpoints.dart';
import '../../../auth_shared_models/responses/register_response.dart';
part 'register_api_client.g.dart';

@injectable
@RestApi()
abstract class RegisterApiClient {
  @factoryMethod
  factory RegisterApiClient(Dio dio) = _RegisterApiClient;

  @POST(AppEndPoints.signUp)
  Future<AuthResponse> register({
    @Body() required Map<String, dynamic> registerResponse,
  });
}
