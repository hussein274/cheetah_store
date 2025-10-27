import 'package:e_commerce/core/api_result/api_result.dart';
import 'package:e_commerce/features/auth/ui/view_model/register_cubit/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/model/request/register_request/register_request.dart';
import '../../../../../core/shared_pref_helper/shared_pref_helper.dart';
import '../../../domain/use-cases/register_use_case.dart';
@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterCubit(this.registerUseCase) : super(RegisterState.initial());

  Future<void> register(String rePassword,String name , String email , String password , String phone)async{
    var request = RegisterRequest(
      name: name,
      email: email,
      password: password,
      phone: phone,
      rePassword: rePassword,
    );



    emit(RegisterState(apiResult: ApiInitial()));
    var response=
    await registerUseCase.call(request);
    emit(RegisterState(apiResult: response));


  }
}