import 'package:equatable/equatable.dart';
import 'package:team_5_examapp/features/auth/register/data/models/user_request_dto.dart';

class UserEntity extends Equatable {
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;

  const UserEntity({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  @override
  List<Object?> get props => [username, firstName, lastName, email, phone];

  UserRequestDto toRequestDto() {
    return UserRequestDto(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
    );
  }

  UserEntity copyWith({
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  }) {
    return UserEntity(
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }
}
