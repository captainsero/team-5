import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:team_5_examapp/core/constants/app_end_points.dart';
import 'package:team_5_examapp/features/auth/forget_password/data/models/responses/forget_password_response.dart';

part 'forget_pass_api_client.g.dart';

@injectable
@RestApi()
abstract class ForgetPassApiClient {
  @factoryMethod
  factory ForgetPassApiClient(Dio dio) = _ForgetPassApiClient;

  @POST(AppEndPoints.forgetPassword)
  Future<ForgetPasswordResponse> forgetPassword({
    @BodyExtra('email') required String email,
  });

  @POST(AppEndPoints.verifyResetCode)
  Future<ForgetPasswordResponse> confirmValidationCode({
    @BodyExtra('resetCode') required String resetCode,
  });

  @PUT(AppEndPoints.resetPassword)
  Future<ForgetPasswordResponse> resetPassword({
    @Body() required Map<String, dynamic> resetPassDto,
  });
}
