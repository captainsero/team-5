import 'package:json_annotation/json_annotation.dart';
import 'package:team_5_examapp/config/shared_models/auth_responses_shared_models/user_response_dto.dart';

part 'register_and_login_model_response.g.dart';

@JsonSerializable()
class RegisterAndLoginModelResponse {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "token")
  String token;
  @JsonKey(name: "user")
  UserResponseDto userResponseDto;

  RegisterAndLoginModelResponse({
    required this.message,
    required this.token,
    required this.userResponseDto,
  });

  RegisterAndLoginModelResponse copyWith({
    String? message,
    String? token,
    UserResponseDto? userResponseDto,
  }) => RegisterAndLoginModelResponse(
    message: message ?? this.message,
    token: token ?? this.token,
    userResponseDto: userResponseDto ?? this.userResponseDto,
  );

  factory RegisterAndLoginModelResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterAndLoginModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterAndLoginModelResponseToJson(this);
}
