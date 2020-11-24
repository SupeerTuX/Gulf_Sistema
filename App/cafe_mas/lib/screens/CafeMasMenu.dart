import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cafe_mas/widgets/utils/HeaderLogo.dart';
import 'package:cafe_mas/DataModel/ProductoModel.dart';

class CafeMasMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                HeaderLogo(
                  titulo: 'Cafe+ MiniMarket',
                  subtitulo:
                      '@cafemasminimarket · Tienda de alimentos naturales',
                  imageAsset: 'assets/cafemas.png',
                  colorTitulo: Colors.brown,
                )
              ],
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4 / 2,
            ),
            delegate: SliverChildListDelegate(
              [
                CardMenu(
                  titulo: 'Torta Polaca',
                  descripcion: 'Torta preparada con carne polaca',
                  img: 'assets/menu/torta-carnepolaca.jpg',
                  colorFondo: Colors.brown,
                  colorTexto: Colors.limeAccent[700],
                  onPress: () {
                    Navigator.of(context)
                        .pushNamed('/producto', arguments: tortaPolaca);
                  },
                ),
                CardMenu(
                  titulo: 'Cafe Capuchino',
                  descripcion: 'Cafe tipo capuchino',
                  img: 'assets/menu/capuchino.jpg',
                  colorFondo: Colors.limeAccent[700],
                  colorTexto: Colors.brown,
                  onPress: () {
                    Navigator.of(context)
                        .pushNamed('/producto', arguments: cafeCapuchino);
                  },
                ),
                CardMenu(
                  titulo: 'Bagel Salado',
                  descripcion: 'Bagel salado tipo pizza',
                  img: 'assets/menu/bagel-salado.jpg',
                  colorFondo: Colors.brown,
                  colorTexto: Colors.limeAccent[700],
                  onPress: () {
                    Navigator.of(context)
                        .pushNamed('/producto', arguments: bagelSalado);
                  },
                ),
                CardMenu(
                  titulo: 'Cafe Expreso',
                  descripcion: 'Cafe expreso de grano',
                  img: 'assets/menu/express.jpg',
                  colorFondo: Colors.limeAccent[700],
                  colorTexto: Colors.brown,
                  onPress: () {
                    Navigator.of(context)
                        .pushNamed('/producto', arguments: cafeExpreso);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardMenu extends StatelessWidget {
  final String titulo;
  final String descripcion;
  final String img;
  final Color colorFondo;
  final Color colorTexto;
  final Function onPress;

  CardMenu({
    this.titulo,
    this.descripcion,
    this.img,
    this.colorFondo,
    this.colorTexto,
    this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: this.colorFondo,
      child: InkWell(
        onTap: () {
          HapticFeedback.vibrate();
          this.onPress();
        },
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                this.titulo,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(img),
                    radius: 32.0,
                  ),
                  SizedBox(width: 10.0),
                  Flexible(
                    child: Text(
                      this.descripcion,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: this.colorTexto),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
