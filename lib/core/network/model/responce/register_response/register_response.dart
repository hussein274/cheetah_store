import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  final String message;
  final UserModel user;
  final String token;

  RegisterResponse({
    required this.message,
    required this.user,
    required this.token,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

@JsonSerializable()
class UserModel {
  final String name;
  final String phone;
  final String password;
  final String email;
  final String role;

  UserModel({
    required this.name,
    required this.phone,
    required this.password,
    required this.email,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
