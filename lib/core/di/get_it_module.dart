import 'package:dio/dio.dart';
import 'package:e_commerce/core/network/api/api_service.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
@module
abstract class GetItModule{
  @lazySingleton
  Dio getDio(){
    final Dio dio=Dio();
    BaseOptions(
      baseUrl: "https://ecommerce.routemisr.com/api/v1",
      validateStatus: (status)=>true
    );
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      error: true,
      compact: false,
      responseHeader: false,

    ));
    return dio;
  }
  @lazySingleton
  ApiService getApiService(Dio dio){
    return ApiService(dio);
  }
}