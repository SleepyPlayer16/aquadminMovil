import 'package:flutter/foundation.dart';

class DataModel {
  double? temperatura;
  double? restante;
  String? fecha;

  DataModel(
      {required this.temperatura, required this.restante, required this.fecha});

  factory DataModel.fromMapJson(Map<String, dynamic> datos) => DataModel(
      temperatura: datos['temperatura'],
      restante: datos['restante'],
      fecha: datos['fecha']);
}
