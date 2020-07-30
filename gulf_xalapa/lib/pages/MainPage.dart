import 'package:flutter/material.dart';
import 'package:gulf_xalapa/widgets/widgets_utils/CardCafeMas.dart';
import 'package:gulf_xalapa/widgets/widgets_utils/CardWallet.dart';

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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Gulf Xalapa'),
          automaticallyImplyLeading: false,
        ),
        body: MainBody(),
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
          CardWallet(),
          CardCafeMas(
            titulo: 'Facturacion',
            subtitulo: 'Cafe+ MiniMarket',
            color_texto: Colors.greenAccent[400],
            color_fondo: Colors.brown,
            icono: Icons.camera_alt,
            fondo_asset: 'assets/cafemas_logo.jpg',
          ),
        ],
      ),
    );
  }
}
