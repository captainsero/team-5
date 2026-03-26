import 'package:json_annotation/json_annotation.dart';

part 'answer_model.g.dart';

@JsonSerializable()
class AnswerModel {
    @JsonKey(name: "answer")
    final String answer;
    @JsonKey(name: "key")
    final String key;

    AnswerModel({
        required this.answer,
        required this.key,
    });

    factory AnswerModel.fromJson(Map<String, dynamic> json) => _$AnswerModelFromJson(json);

    Map<String, dynamic> toJson() => _$AnswerModelToJson(this);
}