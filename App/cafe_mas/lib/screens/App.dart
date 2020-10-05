import 'package:cafe_mas/screens/HomeScreen.dart';

import 'package:flutter/material.dart';

import 'PhoneAuth.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  //? Sesion iniciada??
  bool user = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: user == true ? HomeScreen() : PhoneLogin());
  }
}
