import 'package:e_commerce/core/api_result/api_result.dart';
import 'package:e_commerce/core/network/model/responce/get_all_category_response/get_all_category_resonse.dart';
import 'package:e_commerce/core/network/model/responce/product_response/product_response.dart';

abstract class HomeRemoteDataSource{
  Future <ApiResult<CategoryResponse>> getAllCategories();

  Future<ApiResult<ProductResponse>> getAllProducts();

}






