import 'package:json_annotation/json_annotation.dart';

part 'check_answer_dto.g.dart';

@JsonSerializable()
class CheckAnswerDto {
    @JsonKey(name: "questionId")
    final String questionId;
    @JsonKey(name: "correct")
    final String correct;

    CheckAnswerDto({
        required this.questionId,
        required this.correct,
    });

    factory CheckAnswerDto.fromJson(Map<String, dynamic> json) => _$CheckAnswerDtoFromJson(json);

    Map<String, dynamic> toJson() => _$CheckAnswerDtoToJson(this);
}
