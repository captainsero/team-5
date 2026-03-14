import 'package:json_annotation/json_annotation.dart';
import '../../domain/models/user_model.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {

  int? id;
  String? name;
  String? email;
  String? token;

  UserDto({this.id, this.name, this.email, this.token});

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  UserModel toDomain() {
    return UserModel(
      id: id ?? 0,
      name: name ?? "",
      email: email ?? "",
      token: token ?? "",
    );
  }
}