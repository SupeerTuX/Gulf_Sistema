import 'package:cafe_mas/screens/App.dart';
import 'package:cafe_mas/screens/ConfGulfScreen.dart';
import 'package:cafe_mas/screens/HomeScreen.dart';
import 'package:cafe_mas/screens/ProductoScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Registration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => App(),
        '/producto': (context) => ProductoScreen(),
        '/config': (context) => FacturacionSettingsScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
