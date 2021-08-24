import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:aquadmin_movil/src/models/data_model.dart';
import 'package:aquadmin_movil/src/provider/data_states.dart';
import 'package:get/get.dart';
import 'dart:async';

void main() => runApp(const Home());
String aviso = "";
double? temp = 0;
double? dist = 0;
var _dato;

/// This is the main application widget.
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const String _title = 'Datos';

  @override
  Widget build(BuildContext context) {
    final _mediaSize = MediaQuery.of(context).size.height;
    double _unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    return Material(
      child: Stack(
        children: [
          MyStatefulWidget(),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  0, 0.12 * _mediaSize, 0, 0.79 * _mediaSize),
              child: Text('Bienvenido/a de nuevo.',
                  style: TextStyle(
                      fontFamily: 'yahei',
                      color: Colors.black,
                      fontSize: 3 * _unitHeightValue)),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  0, 0.01 * _mediaSize, 0, 0.79 * _mediaSize),
              child: Text('Hola,' + ' sample text',
                  style: TextStyle(
                      //REEMPLAZAR EL SAMPLE TEXT POR LA FUNCIÓN QUE OBTENDRÁ EL NOMBRE DEL USUARIO
                      fontFamily: 'yahei',
                      color: Colors.black,
                      fontSize: 5 * _unitHeightValue)),
            ),
          ),
          CoolRectangle(),
          Elements(),
          _datos()
        ],
      ),
    );
  }
}

class Elements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _mediaSize = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0.08 * _mediaSize, 0, 0),
            child: Image.asset(
              'img_termometro.png',
              width: 0.25 * _mediaSize,
              height: 0.25 * _mediaSize,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0.5 * _mediaSize, 0, 0),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(flex: 1),
                Image.asset(
                  'img_waterDrop.png',
                  width: 0.1 * _mediaSize,
                  height: 0.1 * _mediaSize,
                ),
                Spacer(),
                Image.asset(
                  'img_temp.png',
                  width: 0.1 * _mediaSize,
                  height: 0.1 * _mediaSize,
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _datos extends StatefulWidget {
  @override
  __datosState createState() => __datosState();
}

class __datosState extends State<_datos> {
  @override
  void initState() {
    final _dataState = Get.put(datoState());
    _dataState.obtenerDatos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    double multiplier = 5.0;
    final _mediaSize = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        GetBuilder<datoState>(builder: (datoState datoState) {
          if (datoState.dato.length > 0) {
            _dato = datoState.dato.last;
            temp = _dato.temperatura;
            dist = _dato.restante;
          }

          return Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0.7 * _mediaSize, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, //Center Row contents horizontally,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(flex: 1),
                  Text(dist.toString() + "%",
                      style: TextStyle(
                          fontSize: 0.06 * _mediaSize,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'yahei')),
                  Spacer(flex: 1),
                  Text(temp.toString() + "°C",
                      style: TextStyle(
                          fontSize: 0.06 * _mediaSize,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'yahei')),
                  Spacer(flex: 1),
                ],
              ),
            ),
          );
        })
      ],
    );
  }
}

class TextDataElements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _mediaSize = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0.7 * _mediaSize, 0, 0),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(flex: 1),
                Text("12" + "%",
                    style: TextStyle(
                        fontSize: 0.06 * _mediaSize,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'yahei')),
                Spacer(flex: 1),
                Text("33" + "°C",
                    style: TextStyle(
                        fontSize: 0.06 * _mediaSize,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'yahei')),
                Spacer(flex: 1),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CoolRectangle extends StatefulWidget {
  @override
  _CoolRectangleState createState() => _CoolRectangleState();
}

class _CoolRectangleState extends State<CoolRectangle> {
  late Timer timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 2), (_) {
      setState(() => CoolRectangle());
      if (dist! <= 20) {
        aviso = "Su mascota necesita más agua.";
      } else if (dist! <= 50) {
        aviso = "Su mascota tiene la mitad de agua.";
      } else {
        aviso = "Su mascota tiene suficiente agua!";
      }
      // your logic her
    });
  }

  @override
  void dispose() {
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final _mediaSize = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding:
            EdgeInsets.fromLTRB(0, 0.01 * _mediaSize, 0, 0.39 * _mediaSize),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0.03 * _mediaSize),
          child: Container(
              child: Stack(children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, 0.01 * _mediaSize, 0.26 * _mediaSize, 0),
                  child: Image.asset(
                    'img_dog.png',
                    width: 0.12 * _mediaSize,
                    height: 0.12 * _mediaSize,
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0.1 * _mediaSize, 0, 0, 0),
                      child: Text(
                          aviso, //REEMPLAZAR CON CODIGO DE NOTIFICACIONES
                          style: TextStyle(
                              fontSize: 0.018 * _mediaSize,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'yahei')),
                    )),
              ]),
              height: 0.15 * _mediaSize,
              width: 0.40 * _mediaSize,
              color: Color.fromRGBO(102, 208, 243, 1)),
        ),
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 2) {
      Navigator.pushNamed(context, '/login');
    }
    if (index == 1) {
      Navigator.pushNamed(context, '/datos', arguments: _dato);
    }
    if (index == 0) {
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final _mediaSize = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 230, 231, 1),
      bottomNavigationBar: SizedBox(
        height: 0.1 * _mediaSize,
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 0.05 * _mediaSize),
              label: 'Home',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_outlined, size: 0.05 * _mediaSize),
              label: 'Datos',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout_outlined, size: 0.05 * _mediaSize),
              label: 'Logout',
              backgroundColor: Colors.purple,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red,
          onTap: _onItemTapped,
          selectedLabelStyle:
              TextStyle(fontSize: 0.02 * _mediaSize, fontFamily: 'yahei'),
          unselectedLabelStyle:
              TextStyle(fontSize: 0.02 * _mediaSize, fontFamily: 'yahei'),
        ),
      ),
    );
  }
}
