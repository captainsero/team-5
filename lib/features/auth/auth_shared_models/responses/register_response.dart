// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromMap(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'package:team_5_examapp/features/auth/auth_shared_models/responses/user_response_dto.dart';
part 'register_response.g.dart';

//RegisterResponse registerResponseFromMap(String str) => RegisterResponse.fromMap(json.decode(str));

//String registerResponseToMap(RegisterResponse data) => json.encode(data.toMap());

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
