import 'package:flutter/foundation.dart';

class LoginModel {
  String? correo;
  String? password;

  LoginModel({required this.correo, required this.password});

  Map<String, dynamic> toJsonLogin() =>
      {'correo': correo, 'password': password};
}
