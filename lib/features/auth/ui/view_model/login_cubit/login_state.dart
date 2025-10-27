import 'package:e_commerce/core/api_result/api_result.dart';

class LoginState {
  late  ApiResult apiResult;
 LoginState.initial(){
   apiResult=ApiInitial();
 }
 LoginState({required this.apiResult});
}