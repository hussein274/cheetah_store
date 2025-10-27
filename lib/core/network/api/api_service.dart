import 'package:dio/dio.dart';
import 'package:e_commerce/core/network/model/request/login_request/login_request.dart';
import 'package:e_commerce/core/network/model/responce/login_response/login_responce.dart';
import 'package:retrofit/retrofit.dart';

import '../model/request/register_request/register_request.dart';
import '../model/responce/get_all_category_response/get_all_category_resonse.dart';
import '../model/responce/product_response/product_response.dart';
import '../model/responce/register_response/register_response.dart';



part 'api_service.g.dart';

@RestApi(
    baseUrl: 'https://ecommerce.routemisr.com/api/v1/')
abstract class ApiService {
  factory ApiService(Dio dio,) = _ApiService;
  @POST('/auth/signin')
  Future<LoginResponse> login(@Body() LoginRequest request);
  @POST('/auth/signup')
  Future<RegisterResponse> register(@Body() RegisterRequest request);

  @GET("categories")
  Future<CategoryResponse> getAllCategories();
  @GET("products")
  Future<ProductResponse> getAllProducts();

  @GET("products?category={id}")
  Future<ProductResponse> getProductsByCategory(@Path("id") String id);
}



