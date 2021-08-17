import 'package:get/get.dart';
import 'package:aquadmin_movil/src/models/user_model.dart';
import 'package:aquadmin_movil/src/provider/user_provider.dart';

class characterState extends GetxController {
  List<UsuariosModel> user = [];
  final _personajesProvider = userProvider();

  Future<void> obtenerUsuarios() async {
    final users = await _personajesProvider.obtenerUsuarios();
    user.addAll(users);
    update();
  }
}
