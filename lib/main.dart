import 'package:flutter/material.dart';
import 'package:aquadmin_movil/src/pages/home_page.dart';
import 'package:aquadmin_movil/src/pages/registro.dart';
import 'package:aquadmin_movil/src/pages/datos.dart';

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
      initialRoute: '/datos',
      routes: {
        '/login': (_) => HomePage(),
        '/datos': (_) => Datos(),
        '/registro': (_) => Registro()
      },
    );
  }
}