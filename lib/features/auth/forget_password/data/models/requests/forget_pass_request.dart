import 'package:json_annotation/json_annotation.dart';

part 'forget_pass_request.g.dart';

@JsonSerializable()
class ForgetPassRequest {
  @JsonKey(name: "email")
  final String email;

  ForgetPassRequest({required this.email});

  factory ForgetPassRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgetPassRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPassRequestToJson(this);
}
