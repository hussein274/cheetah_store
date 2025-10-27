import 'package:e_commerce/core/api_result/api_result.dart';

import 'package:e_commerce/core/network/model/request/login_request/login_request.dart';
import 'package:e_commerce/core/network/model/request/register_request/register_request.dart';

import 'package:e_commerce/core/network/model/responce/login_response/login_responce.dart';
import 'package:e_commerce/core/network/model/responce/register_response/register_response.dart';
import 'package:e_commerce/features/auth/data_source/auth_remot_data_source.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../core/shared_pref_helper/shared_pref_helper.dart';



@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo{
  final AuthRemoteDataSource authRemoteDataSource;
  final SharedPrefHelper sharedPrefHelper;
  AuthRepoImpl(this.authRemoteDataSource,this.sharedPrefHelper);
  @override
  Future<ApiResult<LoginResponse>> getLogin(LoginRequest loginRequest) async{
   ApiResult<LoginResponse> result =await authRemoteDataSource.getLogin(loginRequest);
   try{
     if(result is ApiSuccess<LoginResponse>){
       final token=result.data.token;
       final user=result.data.user;
       await sharedPrefHelper.saveToken(token);
       await sharedPrefHelper.saveUser(UserModel(
           name: user.name,
           phone: "",
           password: "",
           email: user.email,
           role: ""));
     }
     return result;
   }catch(e){
     return ApiError(AppError(e.toString()));
   }

  }

  @override
  Future<ApiResult<RegisterResponse>> getRegister(RegisterRequest registerRequest) async{
  ApiResult <RegisterResponse>result =await authRemoteDataSource.getRegister(registerRequest);
  try{
    if(result is ApiSuccess<RegisterResponse>){
      final token=result.data.token;
      final user=result.data.user;
      await sharedPrefHelper.saveToken(token);
      await sharedPrefHelper.saveUser(user);

    }
    return result;


  }catch(e){
    return ApiError(AppError(e.toString()));
  }

  }

}