import 'package:aquadmin_movil/src/models/data_model.dart';
import 'package:dio/dio.dart';

class dataProvider {
  final String _url = 'https://aquadmin.herokuapp.com/api/sensor';
  final http = Dio();

  Future<List<DataModel>> obtenerDatos() async {
    final response = await http.get(_url);
    List<DataModel> datos = [];
    List<dynamic> responsedata = response.data;
    return responsedata.map((dato) => DataModel.fromMapJson(dato)).toList();
  }
}
