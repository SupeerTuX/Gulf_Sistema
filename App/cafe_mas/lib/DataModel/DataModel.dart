import 'package:flutter/material.dart';

class FormController {
  List<TextEditingController> controller = List(4);
  List<TextInputTheme> theme = List(4);

  FormController() {
    for (var i = 0; i < controller.length; i++) {
      controller[i] = TextEditingController();
    }

    for (var i = 0; i < theme.length; i++) {
      theme[i] = inputThemeFail;
    }
  }
}

//********************************************* */

class TextInputTheme {
  Color textInputColor;
  Color labelColor;

  TextInputTheme({this.labelColor, this.textInputColor});
}

final inputThemeOK = TextInputTheme(
  labelColor: Colors.greenAccent[700],
  textInputColor: Colors.black54,
);

final inputThemeFail = TextInputTheme(
  labelColor: Colors.redAccent[400],
  textInputColor: Colors.black54,
);
