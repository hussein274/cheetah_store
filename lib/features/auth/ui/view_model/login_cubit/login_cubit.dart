import 'package:e_commerce/core/api_result/api_result.dart';
import 'package:e_commerce/features/auth/domain/use-cases/login_use_case.dart';
import 'package:e_commerce/features/auth/ui/view_model/login_cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/model/request/login_request/login_request.dart';
@injectable
class LoginCubit extends Cubit<LoginState> {
 late LoginUseCase _loginUseCase;
  LoginCubit(this._loginUseCase) : super(LoginState.initial());

  Future<void> login(String email , String password)async{
    final request =LoginRequest(email: email, password: password);
    emit(LoginState(apiResult: ApiLoading()));
    var response = await _loginUseCase.call(request);
    emit(LoginState(apiResult: response));

  }
}