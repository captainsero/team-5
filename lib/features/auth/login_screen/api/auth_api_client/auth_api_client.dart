import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../data/models/user_dto.dart';
import 'package:team_5_examapp/core/constants/app_end_points.dart';

part 'auth_api_client.g.dart';

@RestApi()
@injectable
abstract class AuthApiClient {

  @factoryMethod
  factory AuthApiClient(Dio dio) = _AuthApiClient;
  @POST(AppEndPoints.signin)
  Future<UserDto> login(
      @Body() Map<String, dynamic> body,
      );
}