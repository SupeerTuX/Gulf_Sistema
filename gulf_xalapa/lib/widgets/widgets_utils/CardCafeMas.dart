import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardCafeMas extends StatefulWidget {
  final String titulo;
  final String subtitulo;
  final Color colorTexto;
  final Color colorFondo;
  final IconData icono;
  final String fondoAsset;
  final String imgText;
  final Color colorSend;
  final Function accion;
  final Function accionSend;

  CardCafeMas({
    this.titulo,
    this.subtitulo,
    this.colorTexto,
    this.colorFondo,
    this.icono,
    this.fondoAsset,
    this.imgText,
    this.accion,
    this.colorSend,
    this.accionSend,
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
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.colorFondo,
            image: DecorationImage(
              image: AssetImage(widget.fondoAsset),
              fit: BoxFit.contain,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.dstIn),
            ),
          ),
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.titulo,
                      style: TextStyle(fontSize: 28, color: widget.colorTexto),
                    ),
                    IconButton(
                      onPressed: () {
                        HapticFeedback.vibrate();
                        this.widget.accion();
                      },
                      iconSize: 32,
                      icon: Icon(
                        Icons.photo_camera,
                      ),
                      color: Colors.white,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.subtitulo,
                      style: TextStyle(fontSize: 22, color: widget.colorTexto),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Tome una foto de su ticket, en breve le enviaremos \nla factura a su correo',
                      style: TextStyle(
                        color: widget.colorTexto,
                        fontStyle: FontStyle.italic,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.imgText,
                      style: TextStyle(color: widget.colorTexto),
                    ),
                    CircleAvatar(
                      radius: 20,
                      child: InkWell(
                        onTap: () {
                          HapticFeedback.vibrate();
                          widget.accionSend();
                        },
                        child: Icon(
                          Icons.send,
                          color: Colors.grey[400],
                          size: 30,
                        ),
                      ),
                      backgroundColor: widget.colorSend,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
