import 'package:aquadmin_movil/src/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class LoginProvider extends GetxController {
  final _http = Dio();
  final _url = 'https://aquadmin.herokuapp.com/api/auth/signin';
  late LoginModel usuario;
  final _storage = FlutterSecureStorage();
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  Future<String?> login() async {
    final _response = await _http.post(_url, data: usuario.toJsonLogin());
    final _data = _response.data['token'];

    if (_response.statusCode == 200) {
      _storage.write(key: 'token', value: _data);
      return null;
    } else {
      return 'Las credenciales de usuario son incorrectas';
    }
  }

  Future<void> logout() async {
    if (await _storage.read(key: 'token') == null) {
      _storage.delete(key: 'token');
    }
  }

  bool checkValidator() => key.currentState!.validate();
  Future<String?> checkStorageToke() async {
    return await _storage.read(key: 'token') ?? '';
  }
}
