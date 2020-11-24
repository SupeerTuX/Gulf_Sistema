import 'package:cafe_mas/DataModel/DataModel.dart';
import 'package:cafe_mas/utils.dart';
import 'package:cafe_mas/widgets/Input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cafe_mas/Data/SharedKeys.dart';
import 'package:cafe_mas/Services/FirebaseServices.dart';

FormController _cafemas = new FormController();
FormController _gulf = new FormController();
FormController _user = new FormController();

Map<String, dynamic> _mapForm = {
  'nombre': '',
  'puntos': 0,
  'cafemas': {'correo': '', 'direccion': '', 'razon_social': '', 'rfc': ''},
  'petromed': {'correo': '', 'direccion': '', 'razon_social': '', 'rfc': ''},
};

class FacturacionSettingsScreen extends StatefulWidget {
  @override
  _FacturacionSettingsScreenState createState() =>
      _FacturacionSettingsScreenState();
}

class _FacturacionSettingsScreenState extends State<FacturacionSettingsScreen> {
  CollectionReference userData =
      FirebaseFirestore.instance.collection('clientes');

  Map<String, dynamic> data;

  //Cambia el color de los text field
  setColor(TextEditingController controller, TextInputTheme theme) {
    controller.text.isEmpty ? theme = inputThemeFail : theme = inputThemeOK;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuracion'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: userData.doc(currentPhone).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Algo ha salido mal');
          }

          if (snapshot.connectionState == ConnectionState.done) {
            bool isNewDoc = false;
            data = snapshot.data.data();

            if (data == null) {
              isNewDoc = true;
            } else {
              isNewDoc = false;
              //Carga de contenido al formulario
              _user.controller[0].text = data['nombre'];
              _user.controller[0].text.isEmpty
                  ? _user.theme[0] = inputThemeFail
                  : _user.theme[0] = inputThemeOK;

              _cafemas.controller[0].text = data['cafemas']['razon_social'];
              _cafemas.controller[0].text.isEmpty
                  ? _cafemas.theme[0] = inputThemeFail
                  : _cafemas.theme[0] = inputThemeOK;

              _cafemas.controller[1].text = data['cafemas']['rfc'];
              _cafemas.controller[1].text.isEmpty
                  ? _cafemas.theme[1] = inputThemeFail
                  : _cafemas.theme[1] = inputThemeOK;

              _cafemas.controller[2].text = data['cafemas']['direccion'];
              _cafemas.controller[2].text.isEmpty
                  ? _cafemas.theme[2] = inputThemeFail
                  : _cafemas.theme[2] = inputThemeOK;

              _cafemas.controller[3].text = data['cafemas']['correo'];
              _cafemas.controller[3].text.isEmpty
                  ? _cafemas.theme[3] = inputThemeFail
                  : _cafemas.theme[3] = inputThemeOK;

              //Carga de datos para petromed
              _gulf.controller[0].text = data['petromed']['razon_social'];
              _gulf.controller[0].text.isEmpty
                  ? _gulf.theme[0] = inputThemeFail
                  : _gulf.theme[0] = inputThemeOK;

              _gulf.controller[1].text = data['petromed']['rfc'];
              _gulf.controller[1].text.isEmpty
                  ? _gulf.theme[1] = inputThemeFail
                  : _gulf.theme[1] = inputThemeOK;

              _gulf.controller[2].text = data['petromed']['direccion'];
              _gulf.controller[2].text.isEmpty
                  ? _gulf.theme[2] = inputThemeFail
                  : _gulf.theme[2] = inputThemeOK;

              _gulf.controller[3].text = data['petromed']['correo'];
              _gulf.controller[3].text.isEmpty
                  ? _gulf.theme[3] = inputThemeFail
                  : _gulf.theme[3] = inputThemeOK;

              //Copia el contenido de el data al mapform
              _mapForm = data;
            }

            //isNewDoc = true --> el documento no existe, se debe crear uno nuevo
            //isNewDoc = false --> el documento existe, se deba actualizar el documento
            print('DataUser $data');
            return SettingsBody(isNewDoc: isNewDoc);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class SettingsBody extends StatefulWidget {
  final bool isNewDoc;

  const SettingsBody({Key key, this.isNewDoc}) : super(key: key);
  @override
  _SettingsBodyState createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ListTile(
              title: Text(
                'Configuracion',
                style: TextStyle(fontSize: 24),
              ),
              leading: Icon(Icons.settings_applications,
                  size: 42, color: Colors.blue),
              subtitle: Text('Ingrese o edite sus datos de facturacion'),
            ),

            ListTile(
              dense: true,
              leading: Icon(Icons.account_box, size: 30.0),
              title: InputText(
                controller: _user.controller[0],
                hint: 'Nombre',
                theme: _user.theme[0],
                capitalization: TextCapitalization.words,
                clear: () {
                  _user.controller[0].clear();
                  _mapForm['nombre'] = _user.controller[0].text;
                  setState(() {
                    _user.controller[0].text.isEmpty
                        ? _user.theme[0] = inputThemeFail
                        : _user.theme[0] = inputThemeOK;
                  });
                },
                accion: () {
                  print('Nombre de usuario: ${_user.controller[0].text}');
                  _mapForm['nombre'] = _user.controller[0].text;
                  setState(() {
                    _user.controller[0].text.isEmpty
                        ? _user.theme[0] = inputThemeFail
                        : _user.theme[0] = inputThemeOK;
                  });
                },
              ),
              subtitle: Text('Nombre de usuario de su cuenta'),
            ),

            ListTile(
              leading: Icon(Icons.data_usage, size: 30.0),
              title: Text(
                'Facturacion Cafe+',
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text('Igrese los datos de facturacion para cafemas'),
            ),
            ListTile(
              dense: true,
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/logocircular.png'),
              ),
              title: InputText(
                controller: _cafemas.controller[0],
                hint: 'Razon Social',
                theme: _cafemas.theme[0],
                capitalization: TextCapitalization.sentences,
                clear: () {
                  _cafemas.controller[0].clear();
                  _mapForm['cafemas']['razon_social'] =
                      _cafemas.controller[0].text;
                  setState(() {
                    _cafemas.controller[0].text.isEmpty
                        ? _cafemas.theme[0] = inputThemeFail
                        : _cafemas.theme[0] = inputThemeOK;
                  });
                },
                accion: () {
                  _mapForm['cafemas']['razon_social'] =
                      _cafemas.controller[0].text;
                  print(
                      'Razon social Cafe+: ${_mapForm['cafemas']['razon_social']}');
                  setState(() {
                    _cafemas.controller[0].text.isEmpty
                        ? _cafemas.theme[0] = inputThemeFail
                        : _cafemas.theme[0] = inputThemeOK;
                  });
                },
              ),
              subtitle: Text('Razon social'),
            ),
            ListTile(
              dense: true,
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/logocircular.png'),
              ),
              title: InputText(
                controller: _cafemas.controller[1],
                hint: 'RFC',
                theme: _cafemas.theme[1],
                capitalization: TextCapitalization.characters,
                clear: () {
                  _cafemas.controller[1].clear();
                  _mapForm['cafemas']['rfc'] = _cafemas.controller[1].text;
                  setState(() {
                    _cafemas.controller[1].text.isEmpty
                        ? _cafemas.theme[1] = inputThemeFail
                        : _cafemas.theme[1] = inputThemeOK;
                  });
                },
                accion: () {
                  print('RFC Cafe+: ${_cafemas.controller[1].text}');
                  _mapForm['cafemas']['rfc'] = _cafemas.controller[1].text;
                  setState(() {
                    _cafemas.controller[1].text.isEmpty
                        ? _cafemas.theme[1] = inputThemeFail
                        : _cafemas.theme[1] = inputThemeOK;
                  });
                },
              ),
              subtitle: Text('Ingrese su RFC'),
            ),

            ListTile(
              dense: true,
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/logocircular.png'),
              ),
              title: InputText(
                controller: _cafemas.controller[2],
                hint: 'Direccion',
                theme: _cafemas.theme[2],
                capitalization: TextCapitalization.words,
                clear: () {
                  _cafemas.controller[2].clear();
                  _mapForm['cafemas']['direccion'] =
                      _cafemas.controller[2].text;
                  setState(() {
                    _cafemas.controller[2].text.isEmpty
                        ? _cafemas.theme[2] = inputThemeFail
                        : _cafemas.theme[2] = inputThemeOK;
                  });
                },
                accion: () {
                  print('Direccion Cafe+: ${_cafemas.controller[2].text}');
                  _mapForm['cafemas']['direccion'] =
                      _cafemas.controller[2].text;
                  setState(() {
                    _cafemas.controller[2].text.isEmpty
                        ? _cafemas.theme[2] = inputThemeFail
                        : _cafemas.theme[2] = inputThemeOK;
                  });
                },
              ),
              subtitle: Text('Ingrese su direccion'),
            ),

            ListTile(
              dense: true,
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/logocircular.png'),
              ),
              title: InputText(
                controller: _cafemas.controller[3],
                hint: 'Correo Electronico',
                theme: _cafemas.theme[3],
                capitalization: TextCapitalization.none,
                clear: () {
                  _cafemas.controller[3].clear();
                  _mapForm['cafemas']['correo'] = _cafemas.controller[3].text;
                  setState(() {
                    _cafemas.controller[3].text.isEmpty
                        ? _cafemas.theme[3] = inputThemeFail
                        : _cafemas.theme[3] = inputThemeOK;
                  });
                },
                accion: () {
                  print('Correo Cafe+: ${_cafemas.controller[3].text}');
                  _mapForm['cafemas']['correo'] = _cafemas.controller[3].text;
                  setState(() {
                    _cafemas.controller[3].text.isEmpty
                        ? _cafemas.theme[3] = inputThemeFail
                        : _cafemas.theme[3] = inputThemeOK;
                  });
                },
              ),
              subtitle: Text('Ingrese su correo'),
            ),
            //* Copia de datos
            ListTile(
              dense: true,
              leading: Switch(
                value: isSwitched,
                onChanged: (value) {
                  bool exit = false;
                  setState(() {
                    isSwitched = value;
                    if (isSwitched) {
                      //Si se activo la copia de datos
                      //validar el mapa cafemas
                      _mapForm['cafemas'].forEach((k, v) {
                        if (v == '') {
                          print('validacion incorrecta');
                          isSwitched = false;
                          exit = true;
                        }
                      });
                      //Validar el formulario
                      if (exit) {
                        showToast(
                            'Debe ingresar todos los datos de facturacion Cafe+',
                            Colors.red);
                        return;
                      }
                      //Copiar datos del mapa
                      _mapForm['petromed'] = _mapForm['cafemas'];
                      //copia de los mapas
                      //Copiamos datos de los controladores
                      for (int i = 0; i < _cafemas.controller.length; i++) {
                        _gulf.controller[i].text = _cafemas.controller[i].text;
                        //Cambiar el tema de los text input de
                        _gulf.theme[i] = inputThemeOK;
                      }
                      showToast('Datos copiados correctamente', Colors.green);
                    }
                    printMap(m: _mapForm);
                  });
                },
              ),
              title: Text('Copiar datos de facturacion'),
              subtitle: Text('Copie los datos de facturacion de Cafe+ a Gulf'),
            ),
            Divider(),
            //? Gulf Petromed
            ListTile(
              leading: Icon(Icons.data_usage),
              title: Text(
                'Facturacion Gulf/Petromed',
                style: TextStyle(fontSize: 22),
              ),
              subtitle: Text('Igrese los datos de facturacion para Gulf'),
            ),
            ListTile(
              dense: true,
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/logo_gulf2.png'),
              ),
              title: InputText(
                controller: _gulf.controller[0],
                hint: 'Razon Social',
                theme: _gulf.theme[0],
                capitalization: TextCapitalization.sentences,
                clear: () {
                  _gulf.controller[0].clear();
                  _mapForm['petromed']['razon_social'] =
                      _gulf.controller[0].text;

                  setState(() {
                    _gulf.controller[0].text.isEmpty
                        ? _gulf.theme[0] = inputThemeFail
                        : _gulf.theme[0] = inputThemeOK;
                  });
                },
                accion: () {
                  print('Razon social Gulf: ${_gulf.controller[0].text}');
                  _mapForm['petromed']['razon_social'] =
                      _gulf.controller[0].text;
                  setState(() {
                    _gulf.controller[0].text.isEmpty
                        ? _gulf.theme[0] = inputThemeFail
                        : _gulf.theme[0] = inputThemeOK;
                  });
                },
              ),
              subtitle: Text('Ingrese su razon social'),
            ),

            ListTile(
              dense: true,
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/logo_gulf2.png'),
              ),
              title: InputText(
                controller: _gulf.controller[1],
                hint: 'RFC',
                theme: _gulf.theme[1],
                capitalization: TextCapitalization.characters,
                clear: () {
                  _gulf.controller[1].clear();
                  _mapForm['petromed']['rfc'] = _gulf.controller[1].text;
                  setState(() {
                    _gulf.controller[1].text.isEmpty
                        ? _gulf.theme[1] = inputThemeFail
                        : _gulf.theme[1] = inputThemeOK;
                  });
                },
                accion: () {
                  print('RFC Gulf: ${_gulf.controller[1].text}');
                  _mapForm['petromed']['rfc'] = _gulf.controller[1].text;
                  setState(() {
                    _gulf.controller[1].text.isEmpty
                        ? _gulf.theme[1] = inputThemeFail
                        : _gulf.theme[1] = inputThemeOK;
                  });
                },
              ),
              subtitle: Text('Ingrese su RFC'),
            ),

            ListTile(
              dense: true,
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/logo_gulf2.png'),
              ),
              title: InputText(
                controller: _gulf.controller[2],
                hint: 'Direccion',
                theme: _gulf.theme[2],
                capitalization: TextCapitalization.words,
                clear: () {
                  _gulf.controller[2].clear();
                  _mapForm['petromed']['direccion'] = _gulf.controller[2].text;
                  setState(() {
                    _gulf.controller[2].text.isEmpty
                        ? _gulf.theme[2] = inputThemeFail
                        : _gulf.theme[2] = inputThemeOK;
                  });
                },
                accion: () {
                  print('Direccion Gulf: ${_gulf.controller[2].text}');
                  _mapForm['petromed']['direccion'] = _gulf.controller[2].text;
                  setState(() {
                    _gulf.controller[2].text.isEmpty
                        ? _gulf.theme[2] = inputThemeFail
                        : _gulf.theme[2] = inputThemeOK;
                  });
                },
              ),
              subtitle: Text('Ingrese su direccion'),
            ),

            ListTile(
              dense: true,
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/logo_gulf2.png'),
              ),
              title: InputText(
                controller: _gulf.controller[3],
                hint: 'Correo electronico',
                theme: _gulf.theme[3],
                capitalization: TextCapitalization.none,
                clear: () {
                  _gulf.controller[3].clear();
                  _mapForm['petromed']['correo'] = _gulf.controller[3].text;
                  setState(() {
                    _gulf.controller[3].text.isEmpty
                        ? _gulf.theme[3] = inputThemeFail
                        : _gulf.theme[3] = inputThemeOK;
                  });
                },
                accion: () {
                  print('Correo Gulf: ${_gulf.controller[3].text}');
                  _mapForm['petromed']['correo'] = _gulf.controller[3].text;
                  setState(() {
                    _gulf.controller[3].text.isEmpty
                        ? _gulf.theme[3] = inputThemeFail
                        : _gulf.theme[3] = inputThemeOK;
                  });
                },
              ),
              subtitle: Text('Ingrese su correo'),
            ),
            Divider(),

            ListTile(
              leading: Icon(
                Icons.save,
                size: 34.0,
                color: Colors.blue,
              ),
              title: RaisedButton(
                color: Colors.greenAccent,
                onPressed: () {
                  HapticFeedback.vibrate();

                  if (validarDoc(_mapForm)) {
                    //showToast('Guardando cambios', Colors.blue);
                    print('Guardando cambios');
                  } else {
                    showToast('Debe ingresar todos los campos', Colors.red);
                    print('exit');
                    return;
                  }

                  if (widget.isNewDoc) {
                    newDoc(m: _mapForm).then((doc) {
                      doc
                          ? showToast(
                              'Datos ingresados correctamente', Colors.green)
                          : showToast(
                              'Error a guardar datos, intentelo nuevamente',
                              Colors.red);

                      doc
                          ? Navigator.of(context).pushNamedAndRemoveUntil(
                              '/home', (Route<dynamic> route) => false)
                          : null;
                    });
                  } else {
                    updateDoc(m: _mapForm).then((doc) {
                      doc
                          ? showToast(
                              'Datos actualizados correctamente', Colors.green)
                          : showToast(
                              'Error a guardar datos, intentelo nuevamente',
                              Colors.red);

                      doc
                          ? Navigator.of(context).pushNamedAndRemoveUntil(
                              '/home', (Route<dynamic> route) => false)
                          : null;
                    });
                  }
                },
                child: Text(
                  'Guardar Cambios',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 18.0),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

bool validarDoc(Map m) {
  bool validacion = true;

  if (m['nombre'] == '') validacion = false;

  m['cafemas'].forEach((k, v) {
    if (v == '') validacion = false;
  });

  m['petromed'].forEach((k, v) {
    if (v == '') validacion = false;
  });

  return validacion;
}
