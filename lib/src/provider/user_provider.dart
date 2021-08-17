import 'package:aquadmin_movil/src/models/user_model.dart';
import 'package:dio/dio.dart';

class userProvider {
  final String _url = 'https://aquadmin.herokuapp.com/api/usuarios';
  final http = Dio();

  Future<List<UsuariosModel>> obtenerUsuarios() async {
    final response = await http.get(_url);
    List<UsuariosModel> usuarios = [];
    List<dynamic> responsedata = response.data;
    return responsedata.map((user) => UsuariosModel.fromMapJson(user)).toList();
  }
}
