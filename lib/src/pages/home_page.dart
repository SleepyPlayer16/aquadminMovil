import 'package:flutter/material.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  double padd = 200;

  @override
  Widget build(BuildContext context) {
    final double _mediaSize = MediaQuery.of(context).size.height;
    return Material(
      color: Color.fromRGBO(229, 230, 231, 1),
      child: Stack(children: [
        logintext(),
        Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, _mediaSize * 0.35, 0, 0),
            child: MyCustomForm(txt: "Ingresar su correo electronico", pad: 16),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, _mediaSize * 0.25, 0, 0),
          child: loginbutton(),
        ),
        _dogPic(),
      ]),
    );
  }
}

class _dogPic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _mediaSize = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0.04 * _mediaSize, 0, 0.7 * _mediaSize),
      child: Stack(children: [
        Container(
          child: Image.asset(
            'img_dog.png',
            width: 10 * _mediaSize,
            height: 10 * _mediaSize,
          ),
        ),
      ]),
    );
  }
}

class logintext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _mediaSize = MediaQuery.of(context).size.height;
    return Align(
        alignment: Alignment.center,
        child: Padding(
          padding:
              EdgeInsets.fromLTRB(0, 0.01 * _mediaSize, 0, 0.39 * _mediaSize),
          child: Text(
            "Inicio de sesión",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'yahei'),
          ),
        ));
  }
}

class loginbutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _mediaSize = MediaQuery.of(context).size.height;
    return Align(
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () => null,
          child: Text(
            "Iniciar Sesión",
            style: TextStyle(color: Colors.black),
          ),
          style: ButtonStyle(
              padding:
                  MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(
                horizontal: _mediaSize * 0.12,
                vertical: _mediaSize * 0.04,
              )),
              foregroundColor: MaterialStateProperty.all<Color>(
                  Color.fromRGBO(102, 208, 243, 1)),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromRGBO(102, 208, 243, 1)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(color: Colors.black, width: 2.0)))),
        ));
  }
}

class MyCustomForm extends StatefulWidget {
  final String txt;
  final double pad;
  MyCustomForm({Key? key, required this.txt, required this.pad})
      : super(key: key);
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  @override
  Widget build(
    BuildContext context,
  ) {
    final double _mediaSize = MediaQuery.of(context).size.height;
    TextEditingController emailController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: _mediaSize * 0.35,
          child: TextFormField(
            decoration: InputDecoration(
                suffixIcon:
                    Icon(Icons.email, color: Color.fromRGBO(102, 208, 243, 1)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    )),
                hintText: 'Ingresar su correo',
                hintStyle: TextStyle(fontFamily: 'yahei')),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: _mediaSize * 0.04),
          child: Container(
            width: _mediaSize * 0.35,
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  suffixIcon:
                      Icon(Icons.lock, color: Color.fromRGBO(102, 208, 243, 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      )),
                  hintText: 'Ingresar su contraseña',
                  hintStyle: TextStyle(fontFamily: 'yahei')),
            ),
          ),
        ),
      ],
    );
  }
}
