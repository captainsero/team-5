import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:team_5_examapp/core/constants/app_end_points.dart';
import 'package:team_5_examapp/features/auth/forget_password/data/models/requests/confirm_validation_code_request.dart';
import 'package:team_5_examapp/features/auth/forget_password/data/models/requests/forget_pass_request.dart';
import 'package:team_5_examapp/features/auth/forget_password/data/models/reset_pass_dto.dart';
import 'package:team_5_examapp/features/auth/forget_password/data/models/responses/forget_password_response.dart';

part 'forget_pass_api_client.g.dart';

@injectable
@RestApi()
abstract class ForgetPassApiClient {
  @factoryMethod
  factory ForgetPassApiClient(Dio dio) = _ForgetPassApiClient;

  @POST(AppEndPoints.forgetPassword)
  Future<ForgetPasswordResponse> forgetPassword({
    @Body() required ForgetPassRequest forgetPassRequest,
  });

  @POST(AppEndPoints.verifyResetCode)
  Future<ForgetPasswordResponse> confirmValidationCode({
    @Body() required ConfirmValidationCodeRequest confirmValidationCodeRequest,
  });

  @PUT(AppEndPoints.resetPassword)
  Future<ForgetPasswordResponse> resetPassword({
    @Body() required ResetPassDto resetPassDto,
  });
}
