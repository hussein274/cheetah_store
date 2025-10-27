import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api_result/api_result.dart';
import '../../../../core/network/model/request/login_request/login_request.dart';
import '../../../../core/network/model/responce/login_response/login_responce.dart';


@injectable
class LoginUseCase{
  final AuthRepo authRepo;
  LoginUseCase(this.authRepo);

  Future<ApiResult<LoginResponse>> call(LoginRequest loginRequest)async{
    return await authRepo.getLogin(loginRequest);
  }

}