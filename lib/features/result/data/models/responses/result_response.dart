import 'package:json_annotation/json_annotation.dart';
import '../result_dto.dart';

part 'result_response.g.dart';

@JsonSerializable()
class ResultsResponse {
  final String message;
  final List<ResultDto> results;

  ResultsResponse({
    required this.message,
    required this.results,
  });

  factory ResultsResponse.fromJson(Map<String, dynamic> json) =>
      _$ResultsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsResponseToJson(this);
}