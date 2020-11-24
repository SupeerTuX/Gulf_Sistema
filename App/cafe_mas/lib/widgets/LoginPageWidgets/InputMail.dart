import 'package:flutter/material.dart';

class InputMail extends StatefulWidget {
  @override
  _InputMailState createState() => _InputMailState();
}

class _InputMailState extends State<InputMail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            icon: Icon(Icons.account_circle, color: Colors.white),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            border: OutlineInputBorder(),
            fillColor: Colors.white,
            labelText: 'Correo Electronico',
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
