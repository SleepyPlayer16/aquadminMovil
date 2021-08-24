import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:aquadmin_movil/src/models/data_model.dart';
import 'package:aquadmin_movil/src/provider/data_states.dart';
import 'package:get/get.dart';
import 'dart:async';

void main() => runApp(const Datos());

String aviso = "";
double temp = 0;
double dist = 0;
String fecha = "";
var _dato;

/// This is the main application widget.
class Datos extends StatelessWidget {
  const Datos({Key? key}) : super(key: key);

  static const String _title = 'Datos';

  @override
  Widget build(BuildContext context) {
    final _mediaSize = MediaQuery.of(context).size.height;
    return Material(
      child: Stack(
        children: [
          MyStatefulWidget(),
          CoolChart(),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  0, 0.01 * _mediaSize, 0, 0.79 * _mediaSize),
              child: Text('Datos',
                  style: TextStyle(
                      fontFamily: 'yahei', color: Colors.black, fontSize: 35)),
            ),
          ),
          _datos(),
        ],
      ),
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

class CoolChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Día 1": 1,
      "Día 2": 3,
      "Día 3": 2,
      "Día 4": 2,
      "Día 5": 2,
    };
    List<Color> colorList = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
    ];
    return PieChart(
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 32,
      centerText: "CANTIDAD DE AGUA",
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: true,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 1,
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
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 2) {
      Navigator.pushNamed(context, '/login');
    }
    if (index == 1) {
      Navigator.pushNamed(context, '/datos');
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
