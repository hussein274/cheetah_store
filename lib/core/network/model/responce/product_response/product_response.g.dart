// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      status: json['status'] as String?,
      results: (json['results'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'results': instance.results,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

ProductData _$ProductDataFromJson(Map<String, dynamic> json) => ProductData(
  id: json['_id'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  price: (json['price'] as num?)?.toInt(),
  quantity: (json['quantity'] as num?)?.toInt(),
  sold: json['sold'] as num?,
  ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
  ratingsQuantity: (json['ratingsQuantity'] as num?)?.toInt(),
  imageCover: json['imageCover'] as String?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  category: json['category'] == null
      ? null
      : Category.fromJson(json['category'] as Map<String, dynamic>),
  brand: json['brand'] == null
      ? null
      : Brand.fromJson(json['brand'] as Map<String, dynamic>),
  subcategory: (json['subcategory'] as List<dynamic>?)
      ?.map((e) => Subcategory.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'quantity': instance.quantity,
      'sold': instance.sold,
      'ratingsAverage': instance.ratingsAverage,
      'ratingsQuantity': instance.ratingsQuantity,
      'imageCover': instance.imageCover,
      'images': instance.images,
      'category': instance.category?.toJson(),
      'brand': instance.brand?.toJson(),
      'subcategory': instance.subcategory?.map((e) => e.toJson()).toList(),
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'image': instance.image,
};

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'image': instance.image,
};

Subcategory _$SubcategoryFromJson(Map<String, dynamic> json) => Subcategory(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  category: json['category'] as String?,
);

Map<String, dynamic> _$SubcategoryToJson(Subcategory instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'category': instance.category,
    };
