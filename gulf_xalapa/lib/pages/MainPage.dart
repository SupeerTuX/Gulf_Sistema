import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gulf_xalapa/pages/CafeMasMenu.dart';
import 'package:gulf_xalapa/widgets/widgets_utils/CardCafeMas.dart';
import 'package:gulf_xalapa/widgets/widgets_utils/CardWallet.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';

//Lista de rutas de las fotos tomadas
List<String> rutasFotos = new List(2);

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Desea Salir De La Aplicacion?'),
            content: new Text(
                'Si el reporte no se ha enviado, se perdera la informacion'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text('Salir'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('Cancelar'),
              ),
            ],
          ),
        ) ??
        false;
  }

  int _currentIndex = 0;

  List<Widget> _widgetScreen = <Widget>[
    MainBody(),
    FacturacionScreen(),
    CafeMasMenuScreen(),
    Text(
      'Promociones Cafe+',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Gulf Xalapa'),
          //automaticallyImplyLeading: false,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Opciones',
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      image: AssetImage('assets/logo_gulf.png')),
                ),
              ),
              ListTile(
                title: Text('Gulf Facturacion'),
                leading: Icon(Icons.settings),
                onTap: () {
                  HapticFeedback.vibrate();
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/config');
                },
              ),
              ListTile(
                title: Text('Cafe+ Facturacion'),
                leading: Icon(Icons.settings),
                onTap: () {
                  HapticFeedback.vibrate();
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/config');
                },
              ),
              ListTile(
                title: Text('Cerrar Session'),
                leading: Icon(Icons.exit_to_app),
                onTap: () {
                  HapticFeedback.vibrate();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Reset App'),
                leading: Icon(Icons.restore_page),
                onTap: () {
                  HapticFeedback.vibrate();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: _widgetScreen.elementAt(_currentIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.shifting,
          //backgroundColor: Colors.orange[200],
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.orange,
              icon: Icon(Icons.credit_card),
              title: Text('Wallet'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.grey,
              icon: Icon(Icons.receipt),
              title: Text('Facturacion'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.brown,
              icon: Icon(Icons.local_cafe),
              title: Text('Cafe+'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.greenAccent,
              icon: Icon(Icons.star_border),
              title: Text('Promociones'),
            ),
          ],
          onTap: (index) {
            setState(() {
              HapticFeedback.vibrate();
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class MainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              CardWallet(),
              Text(
                'Codigo De Usuario',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Text(
                'Muestre este codigo al despachador',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              QrImage(
                data: 'User:Gulf001',
                version: QrVersions.auto,
                size: 250,
                gapless: false,
                embeddedImage: AssetImage('assets/logo_gulf2.png'),
                embeddedImageStyle: QrEmbeddedImageStyle(size: Size(60, 60)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FacturacionScreen extends StatefulWidget {
  @override
  _FacturacionScreenState createState() => _FacturacionScreenState();
}

class _FacturacionScreenState extends State<FacturacionScreen> {
  final picker = ImagePicker();
  BoxDecoration _fondo = BoxDecoration(); //Imagen de fondo
  String imgTextCafeMas = 'No se ha capturado la imagen';
  String imgTextGulf = 'No se ha capturado la imagen';
  Color fondoIconoCafemas = Colors.white;
  Color fondoIconoGulf = Colors.white;

  Future getImage(int index) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      print(pickedFile.path);
      setState(() {
        //_image = File(pickedFile.path);
        rutasFotos[index] = pickedFile.path;
        if (index == 0) {
          fondoIconoCafemas = Colors.green;
          imgTextCafeMas = 'Imagen Capturada';
        } else if (index == 1) {
          fondoIconoGulf = Colors.green;
          imgTextGulf = 'Imagen Capturada';
        }
        print('Ruta de la imagen: $rutasFotos');
      });
    } else {
      print('No se capturo la imagen');
    }
  }

  void solicitarFactura(int index) {
    if (rutasFotos[index] != null) {
      setState(() {
        print('Solicitando factura');
        rutasFotos[index] = null;
        if (index == 0) {
          fondoIconoCafemas = Colors.white;
          imgTextCafeMas = 'No se ha capturado la imagen';
        } else if (index == 1) {
          fondoIconoGulf = Colors.white;
          imgTextGulf = 'No se ha capturado la imagen';
        }
      });
    } else {
      final snackBar =
          SnackBar(content: Text('Debe capturar la foto del ticket'));
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10.0,
              color: Colors.lightBlue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Solicite Su Factura',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          CardCafeMas(
            titulo: 'Facturacion',
            subtitulo: 'Cafe+ MiniMarket',
            colorTexto: Colors.greenAccent[400],
            colorFondo: Colors.brown,
            icono: Icons.camera_alt,
            fondoAsset: 'assets/cafemas_logo.jpg',
            imgText: imgTextCafeMas,
            colorSend: fondoIconoCafemas,
            accion: () {
              print('Captura de foto Cafe+');
              getImage(0);
            },
            accionSend: () {
              solicitarFactura(0);
            },
          ),
          CardCafeMas(
            titulo: 'Facturacion',
            subtitulo: 'Gulf Xalapa',
            colorTexto: Colors.white,
            colorFondo: Colors.grey,
            icono: Icons.camera_alt,
            fondoAsset: 'assets/logo_gulf2.png',
            imgText: imgTextGulf,
            colorSend: fondoIconoGulf,
            accion: () {
              print('Captura de foto Gulf');
              getImage(1);
            },
            accionSend: () {
              solicitarFactura(1);
            },
          ),
        ],
      ),
    );
  }
}
