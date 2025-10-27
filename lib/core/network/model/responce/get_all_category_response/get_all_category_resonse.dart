import 'package:json_annotation/json_annotation.dart';

part 'get_all_category_resonse.g.dart';

@JsonSerializable()
class CategoryResponse {
  final int results;
  final Metadata metadata;
  final List<CategoryData> data;

  CategoryResponse({
    required this.results,
    required this.metadata,
    required this.data,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}

@JsonSerializable()
class Metadata {
  final int currentPage;
  final int numberOfPages;
  final int limit;

  Metadata({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}

@JsonSerializable()
class CategoryData {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String slug;
  final String image;
  final String createdAt;
  final String updatedAt;

  CategoryData({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDataToJson(this);
}
