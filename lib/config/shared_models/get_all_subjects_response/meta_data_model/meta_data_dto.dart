import 'package:json_annotation/json_annotation.dart';

part 'meta_data_dto.g.dart';

@JsonSerializable()
class MetadataDto {
  @JsonKey(name: "currentPage")
  final int currentPage;
  @JsonKey(name: "numberOfPages")
  final int numberOfPages;
  @JsonKey(name: "limit")
  final int limit;

  MetadataDto({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
  });

  MetadataDto copyWith({int? currentPage, int? numberOfPages, int? limit}) =>
      MetadataDto(
        currentPage: currentPage ?? this.currentPage,
        numberOfPages: numberOfPages ?? this.numberOfPages,
        limit: limit ?? this.limit,
      );

  factory MetadataDto.fromJson(Map<String, dynamic> json) =>
      _$MetadataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataDtoToJson(this);
}
