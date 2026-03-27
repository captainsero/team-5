import 'package:json_annotation/json_annotation.dart';

part 'answer_dto.g.dart';

@JsonSerializable()
class AnswerDto {
    @JsonKey(name: "answer")
    final String answer;
    @JsonKey(name: "key")
    final String key;

    AnswerDto({
        required this.answer,
        required this.key,
    });

    factory AnswerDto.fromJson(Map<String, dynamic> json) => _$AnswerDtoFromJson(json);

    Map<String, dynamic> toJson() => _$AnswerDtoToJson(this);
}