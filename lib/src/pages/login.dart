import 'dart:html';

import 'package:aquadmin_movil/src/models/models.dart';
import 'package:aquadmin_movil/src/provider/user_provider.dart';
import 'package:aquadmin_movil/src/models/user_model.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(Login());

class Login extends StatelessWidget {
  double padd = 200;
  final _loginProvider = Get.find<LoginProvider>();
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

class RIKeys {
  static final riKey1 = GlobalKey<FormState>();

  static final riKey2 = const Key('__RIKEY2__');

  static final riKey3 = const Key('__RIKEY3__');
}

class loginbutton extends StatefulWidget {
  @override
  _loginbuttonState createState() => _loginbuttonState();
}

class _loginbuttonState extends State<loginbutton> {
  final _loginProvider = Get.find<LoginProvider>();

  @override
  Widget build(BuildContext context) {
    final _mediaSize = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () async {
          key:
          RIKeys.riKey1;
          if (!_loginProvider.checkValidator()) return;
          final respuesta = await _loginProvider.login();
        },
        child: Text(
          "Iniciar Sesión",
          style: TextStyle(color: Colors.black),
        ),
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(
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
      ),
    );
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
  void initState() {
    super.initState();
  }

  final _loginProvider = Get.find<LoginProvider>();
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
            onChanged: (data) {
              _loginProvider.usuario.correo = data;
            },
            validator: (data) {
              if (data != '')
                return null;
              else
                return 'Campo obligatorio';
            },
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
              onChanged: (data) {
                _loginProvider.usuario.password = data;
              },
              validator: (data) {
                if (data!.length > 3)
                  return null;
                else
                  return 'Contraseña no valida';
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: true, //PARA QUE EL PASSWORD APAREZCA COMO PUNTOS
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
