import 'dart:ui';
import 'package:cafe_mas/screens/OtpScreen.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class PhoneLogin extends StatefulWidget {
  PhoneLogin({Key key}) : super(key: key);

  @override
  _PhoneLoginState createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final TextEditingController _phoneNumberController = TextEditingController();

  bool isValid = false;

  Future<Null> validate(StateSetter updateState) async {
    print("in validate : ${_phoneNumberController.text.length}");
    if (_phoneNumberController.text.length == 10) {
      updateState(() {
        isValid = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 200,
                child: Image.asset('assets/logo_gulf.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Inicio de sesion',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Inicie sesion o cree una cuenta nueva con su numero de telefono celular. La app Gulf le enviara un SMS para verificar su numero de telefono',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue[900]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton.icon(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
                    color: Colors.orange[700],
                    onPressed: () {
                      print('Inicio de sesion');
                      HapticFeedback.vibrate();
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext bc) {
                            print("VALID CC: $isValid");
                            return StatefulBuilder(builder:
                                (BuildContext context, StateSetter state) {
                              return Container(
                                padding: EdgeInsets.all(16),
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'INICIO DE SESION',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      'Iniciar sesion/Crear una cuenta',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 0),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: _phoneNumberController,
                                        autofocus: true,
                                        onChanged: (text) {
                                          validate(state);
                                        },
                                        decoration: InputDecoration(
                                          labelText:
                                              "Numero movil de 10 digitos",
                                          prefix: Container(
                                            padding: EdgeInsets.all(4.0),
                                            child: Text(
                                              "+52",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        autovalidate: true,
                                        autocorrect: false,
                                        maxLengthEnforced: true,
                                        validator: (value) {
                                          return !isValid
                                              ? 'Porfavor ingrese un numero celular valido de 10 digitos'
                                              : null;
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      child: Center(
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.85,
                                          child: RaisedButton(
                                            color: !isValid
                                                ? Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.5)
                                                : Theme.of(context)
                                                    .primaryColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0.0)),
                                            child: Text(
                                              !isValid
                                                  ? "INGRESE SU NUMERO CELULAR"
                                                  : "CONTINUAR",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            onPressed: () {
                                              if (isValid) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          OTPScreen(
                                                        mobileNumber:
                                                            _phoneNumberController
                                                                .text,
                                                      ),
                                                    ));
                                              } else {
                                                validate(state);
                                              }
                                            },
                                            padding: EdgeInsets.all(16.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                          });
                    },
                    icon: Icon(Icons.login, color: Colors.white),
                    label: Text(
                      'Inicio De Sesion',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
