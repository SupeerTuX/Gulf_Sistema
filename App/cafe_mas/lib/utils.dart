//Print map
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void printMap({Map m}) {
  m.forEach((key, value) {
    print('$key: $value');
  });
}

void showToast(message, Color color) {
  print(message);
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}
