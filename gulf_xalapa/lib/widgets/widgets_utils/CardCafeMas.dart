import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardCafeMas extends StatefulWidget {
  final String titulo;
  final String subtitulo;
  final Color color_texto;
  final Color color_fondo;
  final IconData icono;
  final String fondo_asset;

  CardCafeMas({
    this.titulo,
    this.subtitulo,
    this.color_texto,
    this.color_fondo,
    this.icono,
    this.fondo_asset,
  });
  @override
  _CardCafeMasState createState() => _CardCafeMasState();
}

class _CardCafeMasState extends State<CardCafeMas> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        //color: Colors.orange,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            HapticFeedback.vibrate();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.brown,
              image: DecorationImage(
                image: AssetImage('assets/cafemas_logo.jpg'),
                fit: BoxFit.contain,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.1), BlendMode.dstIn),
              ),
            ),
            height: 180,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Facturacion',
                        style: TextStyle(
                            fontSize: 28, color: Colors.greenAccent[400]),
                      ),
                      Icon(
                        Icons.photo_camera,
                        size: 38,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Cafe+ MiniMarket',
                        style: TextStyle(
                            fontSize: 22, color: Colors.greenAccent[400]),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Tome una foto de su ticket, en breve le enviaremos \nla factura a su correo',
                        style: TextStyle(
                          color: Colors.greenAccent[400],
                          fontStyle: FontStyle.italic,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
