// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromMap(jsonString);

import 'package:json_annotation/json_annotation.dart';

import 'package:team_5_examapp/features/auth/register/data/models/user_dto.dart';

part 'register_response.g.dart';

//RegisterResponse registerResponseFromMap(String str) => RegisterResponse.fromMap(json.decode(str));

//String registerResponseToMap(RegisterResponse data) => json.encode(data.toMap());

@JsonSerializable()
class RegisterResponse {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "token")
  String token;
  @JsonKey(name: "user")
  UserDto userDto;

  RegisterResponse({
    required this.message,
    required this.token,
    required this.userDto,
  });

  RegisterResponse copyWith({
    String? message,
    String? token,
    UserDto? userDto,
  }) => RegisterResponse(
    message: message ?? this.message,
    token: token ?? this.token,
    userDto: userDto ?? this.userDto,
  );

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}
