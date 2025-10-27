import 'package:json_annotation/json_annotation.dart';

part 'product_response.g.dart';
@JsonSerializable(explicitToJson: true)
class ProductResponse {
  final String? status;
  final int? results;
  final List<ProductData>? data;

  ProductResponse({
    this.status,
    this.results,
    this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProductData {
  @JsonKey(name: '_id')
  final String? id;
  final String? title;
  final String? description;
  final int? price;
  final int? quantity;
  final num? sold; // ✅ num بدل int لتفادي الخطأ
  final double? ratingsAverage;
  final int? ratingsQuantity;
  final String? imageCover;
  final List<String>? images;
  final Category? category;
  final Brand? brand;
  final List<Subcategory>? subcategory;

  ProductData({
    this.id,
    this.title,
    this.description,
    this.price,
    this.quantity,
    this.sold,
    this.ratingsAverage,
    this.ratingsQuantity,
    this.imageCover,
    this.images,
    this.category,
    this.brand,
    this.subcategory,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataToJson(this);
}

@JsonSerializable()
class Category {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  Category({this.id, this.name, this.slug, this.image});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Brand {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  Brand({this.id, this.name, this.slug, this.image});

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

  Map<String, dynamic> toJson() => _$BrandToJson(this);
}

@JsonSerializable()
class Subcategory {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? slug;
  final String? category;

  Subcategory({
    this.id,
    this.name,
    this.slug,
    this.category,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) =>
      _$SubcategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SubcategoryToJson(this);
}