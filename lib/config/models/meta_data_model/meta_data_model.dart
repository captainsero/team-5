import 'package:json_annotation/json_annotation.dart';
part 'meta_data_model.g.dart';

@JsonSerializable()
class Metadata {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "numberOfPages")
  final int? numberOfPages;
  @JsonKey(name: "limit")
  final int? limit;

  Metadata({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
  });

  Metadata copyWith({int? currentPage, int? numberOfPages, int? limit}) =>
      Metadata(
        currentPage: currentPage ?? this.currentPage,
        numberOfPages: numberOfPages ?? this.numberOfPages,
        limit: limit ?? this.limit,
      );

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
