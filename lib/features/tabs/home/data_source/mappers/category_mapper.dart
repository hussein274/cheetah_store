import 'package:e_commerce/features/tabs/home/domain/entity/models_entity.dart';

import '../../../../../core/network/model/responce/get_all_category_response/get_all_category_resonse.dart';


/// ✅ يحوّل الريسبونس الكامل من API إلى ليست من الكاتيجوري فقط
extension CategoryMapper on CategoryResponse {
  List<CategoryEntity> toEntityList() {
    return data.map((e) => e.toEntity()).toList();
  }
}

/// ✅ يحوّل كل عنصر كاتيجوري جاي من API إلى كاتيجوري دومين
extension CategoryDataMapper on CategoryData {
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
      slug: slug,
      image: image,
    );
  }
}
