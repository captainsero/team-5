import 'package:json_annotation/json_annotation.dart';
import 'package:team_5_examapp/features/auth/login/domain/models/user_model.dart';
part 'user_request_dto.g.dart';

@JsonSerializable()
class UserRequestDto {
  @JsonKey(name: "username")
  String username;
  @JsonKey(name: "firstName")
  String firstName;
  @JsonKey(name: "lastName")
  String lastName;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "password")
  String password;
  @JsonKey(name: "rePassword")
  String rePassword;
  @JsonKey(name: "phone")
  String phone;

  UserRequestDto({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
  });

  UserRequestDto copyWith({
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? rePassword,
    String? phone,
  }) => UserRequestDto(
    username: username ?? this.username,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    email: email ?? this.email,
    password: password ?? this.password,
    rePassword: rePassword ?? this.rePassword,
    phone: phone ?? this.phone,
  );

  factory UserRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UserRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserRequestDtoToJson(this);

  UserModel toDomain() {
    return UserModel(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
    );
  }
}
