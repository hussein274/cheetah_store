class ProductEntity {
  final String? id;
  final String? title;
  final String? description;
  final int? price;
  final int? quantity;
  final double? ratingsAverage;
  final int? ratingsQuantity;
  final num? sold;
  final String? imageCover;
  final List<String>? images;
  final CategoryEntity? category;
  final BrandEntity? brand;
  final List<SubcategoryEntity>? subcategories;

  ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
    this.ratingsAverage,
    this.ratingsQuantity,
    this.sold,
    required this.imageCover,
    required this.images,
    required this.category,
    required this.brand,
    this.subcategories,
  });
}

class CategoryEntity {
  final String id;
  final String name;
  final String slug;
  final String? image;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.slug,
    this.image,
  });
}

class BrandEntity {
  final String id;
  final String name;
  final String? image;

  BrandEntity({
    required this.id,
    required this.name,
    this.image,
  });
}

class SubcategoryEntity {
  final String id;
  final String name;
  final String? category;

  SubcategoryEntity({
    required this.id,
    required this.name,
    this.category,
  });
}
