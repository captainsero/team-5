import 'package:json_annotation/json_annotation.dart';

part 'reset_pass_dto.g.dart';

@JsonSerializable()
class ResetPassDto {
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "newPassword")
  final String newPassword;

  ResetPassDto({required this.email, required this.newPassword});

  factory ResetPassDto.fromJson(Map<String, dynamic> json) =>
      _$ResetPassDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPassDtoToJson(this);
}
