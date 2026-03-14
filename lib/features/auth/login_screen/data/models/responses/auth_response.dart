// To parse this JSON data, do
//
//     final AuthResponse = AuthResponseFromMap(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'package:team_5_examapp/features/auth/login_screen/data/models/user_dto.dart';
import 'package:team_5_examapp/features/auth/login_screen/domain/models/user_model.dart';

part 'auth_response.g.dart';

//AuthResponse AuthResponseFromMap(String str) => AuthResponse.fromMap(json.decode(str));

//String AuthResponseToMap(AuthResponse data) => json.encode(data.toMap());

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

  UserModel toDomain() {
    return userDto.toDomain();
  }

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
