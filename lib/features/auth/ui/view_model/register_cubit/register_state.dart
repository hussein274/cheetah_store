import '../../../../../core/api_result/api_result.dart';

class RegisterState {
  late ApiResult apiResult;

  RegisterState.initial(){
    apiResult = ApiInitial();
  }
  RegisterState({required this.apiResult});

}