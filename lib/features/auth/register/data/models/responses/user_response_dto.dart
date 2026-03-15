import 'package:json_annotation/json_annotation.dart';
part 'user_response_dto.g.dart';

@JsonSerializable()
class UserResponseDto {
  @JsonKey(name: "username")
  String username;
  @JsonKey(name: "firstName")
  String firstName;
  @JsonKey(name: "lastName")
  String lastName;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "phone")
  String phone;
  @JsonKey(name: "role")
  String? role;
  @JsonKey(name: "isVerified")
  bool? isVerified;
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;

  UserResponseDto({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    this.role,
    this.isVerified,
    this.id,
    this.createdAt,
  });

  UserResponseDto copyWith({
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? role,
    bool? isVerified,
    String? id,
    DateTime? createdAt,
  }) => UserResponseDto(
    username: username ?? this.username,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    role: role ?? this.role,
    isVerified: isVerified ?? this.isVerified,
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
  );

  factory UserResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UserResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseDtoToJson(this);
}
