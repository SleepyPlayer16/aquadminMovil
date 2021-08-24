import 'package:aquadmin_movil/src/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aquadmin_movil/src/models/user_model.dart';

class CheckStorage extends StatelessWidget {
  final _loginProvider = Get.put(LoginProvider());
  @override
  Widget build(BuildContext context) {
    _loginProvider.usuario = LoginModel(correo: '', password: '');
    return Scaffold(
      body: FutureBuilder(
          future: _loginProvider.checkStorageToke(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) return Text('Cargando...');

            if (snapshot.data == '') {
              Future.microtask(() => null);
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                Navigator.pushReplacementNamed(context, '/home');
              });
            } else {
              Future.microtask(() => null);
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                Navigator.pushReplacementNamed(context, '/login');
              });
            }
            return Container();
          }),
    );
  }
}
