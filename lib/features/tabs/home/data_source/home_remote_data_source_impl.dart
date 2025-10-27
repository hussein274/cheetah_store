import 'package:e_commerce/core/api_result/api_result.dart';
import 'package:e_commerce/core/network/api/api_service.dart';
import 'package:e_commerce/core/network/model/responce/get_all_category_response/get_all_category_resonse.dart';
import 'package:e_commerce/core/network/model/responce/product_response/product_response.dart';
import 'package:e_commerce/features/tabs/home/data_source/home_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
  ApiService _apiService;
  HomeRemoteDataSourceImpl(this._apiService);
  @override
  Future<ApiResult<CategoryResponse>> getAllCategories() async{

    try {
      final category = await _apiService.getAllCategories();
      return ApiSuccess(category);
    }catch(e){
      return ApiError(AppError(e.toString()));
    }
  }

  @override
  Future<ApiResult<ProductResponse>> getAllProducts()async {
   try {
     final products=await _apiService.getAllProducts();
     return ApiSuccess(products);

   }catch(e){
    return ApiError(AppError(e.toString()));
   }
  }

}