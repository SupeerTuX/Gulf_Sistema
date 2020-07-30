import 'package:flutter/material.dart';

class InputPassword extends StatefulWidget {
  @override
  _InputPasswordState createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.vpn_key, color: Colors.white),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            border: OutlineInputBorder(),
            labelText: 'Password',
            labelStyle: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
