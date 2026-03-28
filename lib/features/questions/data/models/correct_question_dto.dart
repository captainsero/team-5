import 'package:json_annotation/json_annotation.dart';
import 'package:team_5_examapp/features/questions/data/models/responses/check_question_response.dart';

part 'correct_question_dto.g.dart';

@JsonSerializable()
class CorrectQuestionDto {
    @JsonKey(name: "QID")
    final String qid;
    @JsonKey(name: "Question")
    final String question;
    @JsonKey(name: "correctAnswer")
    final String correctAnswer;
    @JsonKey(name: "answers")
    final Answers answers;

    CorrectQuestionDto({
        required this.qid,
        required this.question,
        required this.correctAnswer,
        required this.answers,
    });

    factory CorrectQuestionDto.fromJson(Map<String, dynamic> json) => _$CorrectQuestionDtoFromJson(json);

    Map<String, dynamic> toJson() => _$CorrectQuestionDtoToJson(this);
}