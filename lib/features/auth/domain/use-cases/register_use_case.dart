import '../../../../core/api_result/api_result.dart';
import '../../../../core/network/model/request/register_request/register_request.dart';
import '../../../../core/network/model/responce/register_response/register_response.dart';
import '../repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase{
  final AuthRepo authRepo;
  RegisterUseCase(this.authRepo);

  Future<ApiResult<RegisterResponse>> call(
      RegisterRequest registerRequest)async{
    return await authRepo.getRegister(registerRequest);
  }
}