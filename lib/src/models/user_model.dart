import 'package:flutter/foundation.dart';

class UsuariosModel {
  String? id;
  String? nombre;
  String? correo;
  String? password;

  UsuariosModel(
      {required this.id,
      required this.nombre,
      required this.correo,
      required this.password});

  factory UsuariosModel.fromMapJson(Map<String, dynamic> user) => UsuariosModel(
      id: user['id'],
      nombre: user['nombre'],
      correo: user['correo'],
      password: user['password']);
}
