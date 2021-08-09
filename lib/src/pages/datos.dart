import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

void main() => runApp(const Datos());

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
        ],
      ),
    );
  }
}

class CoolChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Map<String, double> dataMap = {
      "Sample text 1": 5,
      "Sample text 2": 3,
      "Sample text 3": 2,
      "Sample text 4": 2,
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
      centerText: "HYBRID",
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
    if (index == 1) {
      Navigator.pushNamed(context, '/datos');
    }
    if (index == 0) {
      Navigator.pushNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 230, 231, 1),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'Datos',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout_outlined),
            label: 'Logout',
            backgroundColor: Colors.purple,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
        selectedLabelStyle: TextStyle(fontFamily: 'yahei'),
        unselectedLabelStyle: TextStyle(fontFamily: 'yahei'),
      ),
    );
  }
}