// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_pass_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPassDto _$ResetPassDtoFromJson(Map<String, dynamic> json) => ResetPassDto(
  email: json['email'] as String,
  newPassword: json['newPassword'] as String,
);

Map<String, dynamic> _$ResetPassDtoToJson(ResetPassDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'newPassword': instance.newPassword,
    };
