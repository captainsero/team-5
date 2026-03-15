// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromMap(jsonString);

import 'package:json_annotation/json_annotation.dart';

import 'package:team_5_examapp/features/auth/register/data/models/user_dto.dart';

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
  UserDto userDto;

  AuthResponse({
    required this.message,
    required this.token,
    required this.userDto,
  });

  AuthResponse copyWith({String? message, String? token, UserDto? userDto}) =>
      AuthResponse(
        message: message ?? this.message,
        token: token ?? this.token,
        userDto: userDto ?? this.userDto,
      );

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
