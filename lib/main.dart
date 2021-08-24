import 'package:flutter/material.dart';
import 'package:aquadmin_movil/src/pages/login.dart';
import 'package:aquadmin_movil/src/pages/registro.dart';
import 'package:aquadmin_movil/src/pages/datos.dart';
import 'package:aquadmin_movil/src/pages/home.dart';
import 'package:aquadmin_movil/src/pages/check_storage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aquadmin',
      initialRoute: '/home',
      routes: {
        '/home': (_) => Home(),
        '/login': (_) => Login(),
        '/datos': (_) => Datos(),
        '/registro': (_) => Registro(),
        '/check': (_) => CheckStorage()
      },
    );
  }
}
