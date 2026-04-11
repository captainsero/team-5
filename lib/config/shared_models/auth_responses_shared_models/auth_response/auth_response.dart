import 'package:json_annotation/json_annotation.dart';
<<<<<<<< HEAD:lib/features/auth/auth_shared_models/responses/auth_response.dart
import 'package:team_5_examapp/features/auth/auth_shared_models/responses/user_response_dto.dart';
part 'auth_response.g.dart';
========
import 'package:team_5_examapp/config/shared_models/auth_responses_shared_models/user_response_dto.dart';
>>>>>>>> demo:lib/config/shared_models/auth_responses_shared_models/auth_response/auth_response.dart

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "token")
  String token;
  @JsonKey(name: "user")
  UserResponseDto userResponseDto;

  AuthResponse({
    required this.message,
    required this.token,
    required this.userResponseDto,
  });

  AuthResponse copyWith({
    String? message,
    String? token,
    UserResponseDto? userResponseDto,
  }) => AuthResponse(
    message: message ?? this.message,
    token: token ?? this.token,
    userResponseDto: userResponseDto ?? this.userResponseDto,
  );

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
