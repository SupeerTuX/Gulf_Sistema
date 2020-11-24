import 'package:cafe_mas/screens/HomeScreen.dart';
import 'package:cafe_mas/screens/ConfGulfScreen.dart';
import 'package:flutter/material.dart';

import 'package:cafe_mas/Data/SharedKeys.dart';
import 'PhoneAuth.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  //? Sesion iniciada??
  bool isLogged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyanAccent[400],
        body: FutureBuilder(
          future: autoLogin(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }
            //Operacion correcta
            if (snapshot.hasData) {
              //Si el usuario ya esta logeado
              switch (snapshot.data) {
                case 0:
                  return PhoneLogin();
                  break;
                case 1:
                  return HomeScreen();
                  break;
                case 2:
                  return FacturacionSettingsScreen();
                  break;
                default:
              }
              //logOut();
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
