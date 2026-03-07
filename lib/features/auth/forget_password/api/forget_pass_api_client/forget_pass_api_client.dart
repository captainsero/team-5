import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:team_5_examapp/core/constants/app_end_points.dart';

part 'forget_pass_api_client.g.dart';

@injectable
@RestApi()
abstract class ForgetPassApiClient {
  @factoryMethod
  factory ForgetPassApiClient(Dio dio) = _ForgetPassApiClient;

  @POST(AppEndPoints.forgetPassword)
  Future<void> forgetPassword({@Body() Map<String, dynamic>? body});
}
