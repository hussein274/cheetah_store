import 'package:e_commerce/core/network/model/responce/register_response/register_response.dart';

import '../../../core/api_result/api_result.dart';
import '../../../core/network/model/request/login_request/login_request.dart';
import '../../../core/network/model/request/register_request/register_request.dart';
import '../../../core/network/model/responce/login_response/login_responce.dart';

abstract class AuthRemoteDataSource{


  Future<ApiResult<RegisterResponse>> getRegister(RegisterRequest registerRequest);
  Future<ApiResult<LoginResponse>> getLogin(LoginRequest loginRequest);

}