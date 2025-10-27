import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../network/model/responce/register_response/register_response.dart';

@Injectable()
class SharedPrefHelper {
Future<void>saveToken(String token)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);

}
Future<void>saveUser(UserModel user)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
 var userJson = user.toJson();
 await prefs.setString('user', jsonEncode(userJson));


}

Future<String?>getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');

}

Future<UserModel?>getUser()async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? userJson = prefs.getString('user');
  if (userJson != null) {
    return UserModel.fromJson(jsonDecode(userJson));
  }

}

}