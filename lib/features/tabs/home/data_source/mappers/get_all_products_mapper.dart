import 'package:e_commerce/features/tabs/home/domain/entity/models_entity.dart';
import '../../../../../core/network/model/responce/product_response/product_response.dart';

/// ✅ يحوّل ProductResponse إلى ليست من ProductEntity
extension ProductResponseMapper on ProductResponse {
  List<ProductEntity> toEntityList() {
    // هنا data هي ليستة المنتجات مباشرة
    return data?.map((e) => e.toEntity()).toList() ?? [];
  }
}

/// ✅ يحوّل كل ProductData إلى ProductEntity
extension ProductDataMapper on ProductData {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id ?? "",
      title: title ?? "",
      description: description ?? "",
      price: price ?? 0,
      quantity: quantity ?? 0,
      ratingsAverage: ratingsAverage ?? 0,
      ratingsQuantity: ratingsQuantity ?? 0,
      sold: sold ?? 0, // ✅ هنا كانت ناقصة القيمة الافتراضية
      imageCover: imageCover ?? "",
      images: images ?? [],
      category: category?.toEntity() ??
          CategoryEntity(id: "", name: "", image: "", slug: ""),
      brand:
      brand?.toEntity() ?? BrandEntity(id: "", name: "", image: ""),
      subcategories:
      subcategory?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

/// ✅ يحوّل Category داخل المنتج
extension ProductCategoryMapper on Category {
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id ?? "",
      name: name ?? "",
      image: image ?? "",
      slug: slug ?? "",
    );
  }
}

/// ✅ يحوّل Brand داخل المنتج
extension BrandMapper on Brand {
  BrandEntity toEntity() {
    return BrandEntity(
      id: id ?? "",
      name: name ?? "",
      image: image ?? "",
    );
  }
}

/// ✅ يحوّل Subcategory داخل المنتج
extension SubcategoryMapper on Subcategory {
  SubcategoryEntity toEntity() {
    return SubcategoryEntity(
      id: id ?? "",
      name: name ?? "",
      category: category ?? "",
    );
  }
}