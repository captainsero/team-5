import 'package:json_annotation/json_annotation.dart';

part 'confirm_validation_code_request.g.dart';

@JsonSerializable()
class ConfirmValidationCodeRequest {
  @JsonKey(name: "resetCode")
  final String resetCode;

  ConfirmValidationCodeRequest({required this.resetCode});

  factory ConfirmValidationCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$ConfirmValidationCodeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmValidationCodeRequestToJson(this);
}
