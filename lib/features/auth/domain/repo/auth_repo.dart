import 'package:e_commerce/core/api_result/api_result.dart';
import 'package:e_commerce/core/network/model/request/login_request/login_request.dart';
import 'package:e_commerce/core/network/model/responce/login_response/login_responce.dart';

import '../../../../core/network/model/request/register_request/register_request.dart';
import '../../../../core/network/model/responce/register_response/register_response.dart';

 abstract class AuthRepo{
  Future<ApiResult<LoginResponse>> getLogin(LoginRequest loginRequest);
  Future<ApiResult<RegisterResponse>> getRegister(RegisterRequest registerRequest);

}