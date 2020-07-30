import 'package:flutter/material.dart';
import 'package:gulf_xalapa/widgets/LoginPageWidgets/InputMail.dart';
import 'package:gulf_xalapa/widgets/LoginPageWidgets/InputPassword.dart';
import 'package:gulf_xalapa/widgets/LoginPageWidgets/LoginButton.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent[400],
      body: LoginHome(),
    );
  }
}

class LoginHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 170,
                child: Image.asset('assets/logo_gulf.png'),
              ),
              InputMail(),
              InputPassword(),
              LoginButton(),
            ],
          ),
        ],
      ),
    );
  }
}
