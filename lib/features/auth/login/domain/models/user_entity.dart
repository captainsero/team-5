import 'package:team_5_examapp/config/shared_models/auth_responses_shared_models/register_and_login_model_response/register_and_login_model_response.dart';

class UserEntity {
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;

  UserEntity({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  factory UserEntity.fromAuthResponse(
    RegisterAndLoginModelResponse authResponse,
  ) {
    return UserEntity(
      username: authResponse.userResponseDto.username,
      firstName: authResponse.userResponseDto.firstName,
      lastName: authResponse.userResponseDto.lastName,
      email: authResponse.userResponseDto.email,
      phone: authResponse.userResponseDto.phone,
    );
  }
}
