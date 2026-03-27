import 'package:team_5_examapp/features/auth/auth_shared_models/responses/register_response.dart';

class UserModel {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  UserModel({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  factory UserModel.fromAuthResponse(AuthResponse authResponse) {
    return UserModel(
      username: authResponse.userResponseDto.username,
      firstName: authResponse.userResponseDto.firstName,
      lastName: authResponse.userResponseDto.lastName,
      email: authResponse.userResponseDto.email,
      phone: authResponse.userResponseDto.phone,
    );
  }
}
