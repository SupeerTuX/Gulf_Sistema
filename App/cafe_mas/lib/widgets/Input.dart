import 'package:cafe_mas/DataModel/DataModel.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final Function accion;
  final Function clear;
  final TextInputTheme theme;
  final TextCapitalization capitalization;
  final TextInputType inputType;
  final bool enable;

  InputText({
    this.hint,
    this.controller,
    this.accion,
    this.theme,
    this.inputType,
    this.capitalization,
    this.enable,
    this.clear,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: TextField(
        enabled: enable,
        keyboardType: inputType,
        textCapitalization: capitalization,
        style: TextStyle(color: this.theme.textInputColor),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              clear();
            },
          ),
          border: OutlineInputBorder(),
          labelText: this.hint,
          labelStyle: TextStyle(
            color: this.theme.labelColor,
          ),
        ),
        controller: controller,
        onChanged: (value) {
          this.accion();
        },
        onSubmitted: (value) {
          this.accion();
        },
      ),
    );
  }
}
