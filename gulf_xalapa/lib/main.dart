import 'package:flutter/material.dart';
import 'package:gulf_xalapa/pages/ConfGulfScreen.dart';
import 'package:gulf_xalapa/pages/LoginPage.dart';
import 'package:gulf_xalapa/pages/MainPage.dart';
import 'package:gulf_xalapa/pages/ProductoScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => LoginPage(),
        '/main': (context) => MainPage(),
        '/producto': (context) => ProductoScreen(),
        '/config': (context) => FacturacionSettingsScreen(),
      },
    );
  }
}
