import '../../domain/models/user_model.dart';

class UserDto {

  int? id;
  String? name;
  String? email;
  String? token;

  UserDto({this.id, this.name, this.email, this.token});

  factory UserDto.fromJson(Map<String, dynamic> json) {

    return UserDto(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      token: json['token'],
    );
  }

  UserModel toDomain() {

    return UserModel(
      id: id ?? 0,
      name: name ?? "",
      email: email ?? "",
      token: token ?? "",
    );
  }
}