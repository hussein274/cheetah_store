import 'package:e_commerce/core/api_result/api_result.dart';
import 'package:e_commerce/core/network/model/responce/product_response/product_response.dart';
import 'package:e_commerce/features/tabs/home/data_source/home_remote_data_source.dart';
import 'package:e_commerce/features/tabs/home/data_source/mappers/category_mapper.dart';
import 'package:e_commerce/features/tabs/home/data_source/mappers/get_all_products_mapper.dart';
import 'package:e_commerce/features/tabs/home/domain/entity/models_entity.dart'
   ;
import 'package:e_commerce/features/tabs/home/domain/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/model/responce/get_all_category_response/get_all_category_resonse.dart';
@Injectable(as: HomeRepo)
class HomeRepoImpl extends HomeRepo{
HomeRemoteDataSource _homeRemoteDataSource;

HomeRepoImpl(this._homeRemoteDataSource);

  @override
  Future<ApiResult<List<CategoryEntity>>> loadCategories() async{
    try {
      final response= await _homeRemoteDataSource.getAllCategories();
      if(response is ApiSuccess<CategoryResponse>){
        final categories=response.data.toEntityList();
        return ApiSuccess(categories);
      }else if(response is ApiError){
        return ApiError(AppError("some thing went wrong"));
      }else {
        return ApiError(AppError("Unexpected response type"));
      }

    } catch (e) {
      return ApiError(AppError(e.toString()));

    }


  }

@override
Future<ApiResult<List<ProductEntity>>> loadProducts() async {
  try {
    final products = await _homeRemoteDataSource.getAllProducts();

    if (products is ApiSuccess<ProductResponse>) {
      // نعمل cast لأن Retrofit ممكن يرجع dynamic
      final productResponse =  products.data ;
      final entities = productResponse.toEntityList();
      return ApiSuccess(entities);
    } else if (products is ApiError) {
      // طبع الخطأ الفعلي لو موجود
      return ApiError(AppError(""));
    } else {
      return ApiError(AppError("Unexpected response type"));
    }
  } catch (e) {
    return ApiError(AppError(e.toString()));
  }
}
}