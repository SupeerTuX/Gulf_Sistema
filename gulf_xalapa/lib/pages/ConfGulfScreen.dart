import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FacturacionSettingsScreen extends StatefulWidget {
  @override
  _FacturacionSettingsScreenState createState() =>
      _FacturacionSettingsScreenState();
}

class _FacturacionSettingsScreenState extends State<FacturacionSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuracion'),
      ),
      body: SettingsBody(),
    );
  }
}

class SettingsBody extends StatefulWidget {
  @override
  _SettingsBodyState createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ListTile(
              title: Text(
                'Datos de facturacion',
                style: TextStyle(fontSize: 24),
              ),
              leading: Icon(
                Icons.settings_applications,
                size: 42,
                color: Colors.blue,
              ),
              subtitle: Text('Ingrese o edite sus datos de facturacion'),
            ),
            InputForm(
              hint: 'Nombre',
              maxLines: 1,
            ),
            InputForm(
              hint: 'RFC',
              maxLines: 1,
            ),
            InputForm(
              hint: 'Direccion',
              maxLines: 3,
            ),
            InputForm(
              hint: 'Correo',
              maxLines: 1,
            ),
          ],
        ),
        SaveSeccion(),
      ],
    );
  }
}

class InputForm extends StatefulWidget {
  final String hint;
  final int maxLines;

  InputForm({
    this.hint,
    this.maxLines,
  });
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  String inputValue = '';
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: TextField(
        maxLines: widget.maxLines,
        decoration: InputDecoration(
          labelText: widget.hint,
          hintText: widget.hint,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class SaveSeccion extends StatefulWidget {
  @override
  _SaveSeccionState createState() => _SaveSeccionState();
}

class _SaveSeccionState extends State<SaveSeccion> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            color: Colors.green[300],
            child: InkWell(
              onTap: () {
                HapticFeedback.vibrate();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 200,
                  height: 25,
                  child: Text(
                    'Guardar',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
        Text('Desbloquear'),
        Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
              HapticFeedback.vibrate();
            });
          },
        ),
      ],
    );
  }
}
