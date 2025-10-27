import 'package:e_commerce/core/api_result/api_result.dart';
import 'package:e_commerce/core/network/model/request/login_request/login_request.dart';
import 'package:e_commerce/core/network/model/request/register_request/register_request.dart';
import 'package:e_commerce/core/network/model/responce/login_response/login_responce.dart';
import 'package:e_commerce/core/network/model/responce/register_response/register_response.dart';
import 'package:e_commerce/core/network/api/api_service.dart';
import 'package:e_commerce/features/auth/data_source/auth_remot_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImpl(this.apiService);

  @override
  Future<ApiResult<LoginResponse>> getLogin(LoginRequest loginRequest) async {
    try {
      final response = await apiService.login(loginRequest);
      // نرجع ApiSuccess مباشرة من البيانات اللي جت من API
      return ApiSuccess(response);
    } catch (e) {
      // أي خطأ يتحول لـ ApiError
      return ApiError(AppError(e.toString()));
    }
  }

  @override
  Future<ApiResult<RegisterResponse>> getRegister(RegisterRequest registerRequest) async {
    try {
      final response = await apiService.register(registerRequest);
      return ApiSuccess(response);
    } catch (e) {
      return ApiError(AppError(e.toString()));
    }
  }
}

// AppError مخصص لكل UseCase
class LoginAppError extends AppError {
  LoginAppError(String message) : super(message);
}

class RegisterAppError extends AppError {
  RegisterAppError(String message) : super(message);
}