import 'package:json_annotation/json_annotation.dart';
import 'package:team_5_examapp/features/questions/data/models/check_answer_dto.dart';

part 'check_question_request.g.dart';

@JsonSerializable()
class CheckQuestionRequest {
    @JsonKey(name: "answers")
    final List<CheckAnswerDto> answers;
    @JsonKey(name: "time")
    final int time;

    CheckQuestionRequest({
        required this.answers,
        required this.time,
    });

    factory CheckQuestionRequest.fromJson(Map<String, dynamic> json) => _$CheckQuestionRequestFromJson(json);

    Map<String, dynamic> toJson() => _$CheckQuestionRequestToJson(this);
}