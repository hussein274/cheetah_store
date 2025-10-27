import 'package:e_commerce/core/api_result/api_result.dart';
import 'package:e_commerce/features/tabs/home/domain/entity/models_entity.dart';
class ProductsState{
  final ApiResult<List<ProductEntity>> products;

  ProductsState({required this.products});

  ProductsState.initial() : products = ApiInitial();

}