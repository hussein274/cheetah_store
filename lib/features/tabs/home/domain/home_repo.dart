import 'package:e_commerce/core/api_result/api_result.dart';
import 'package:e_commerce/features/tabs/home/domain/entity/models_entity.dart'
   ;


abstract class HomeRepo{
  Future<ApiResult<List<CategoryEntity>>> loadCategories();

  Future<ApiResult<List<ProductEntity>>> loadProducts();
}