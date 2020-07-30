import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 50, left: 200, bottom: 40),
      child: ButtonTheme(
        height: 50,
        child: RaisedButton(
          highlightElevation: 10,
          onPressed: () {
            HapticFeedback.vibrate();
            Navigator.of(context).pushNamed('/main');
          },
          child: Text(
            'ENTRAR',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          color: Colors.orange,
        ),
      ),
    );
  }
}
