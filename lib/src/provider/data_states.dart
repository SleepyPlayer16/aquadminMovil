import 'package:get/get.dart';
import 'package:aquadmin_movil/src/models/data_model.dart';
import 'package:aquadmin_movil/src/provider/data_provider.dart';

class datoState extends GetxController {
  List<DataModel> dato = [];
  final _dataProvider = dataProvider();

  Future<void> obtenerDatos() async {
    final datos = await _dataProvider.obtenerDatos();
    dato.addAll(datos);
    update();
  }
}
