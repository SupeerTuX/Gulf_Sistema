import 'package:flutter/material.dart';
import 'package:cafe_mas/DataModel/ProductoModel.dart';

class ProductoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nombre'),
        backgroundColor: Colors.limeAccent[700],
      ),
      body: ProductoBody(),
    );
  }
}

class ProductoBody extends StatefulWidget {
  @override
  _ProductoBodyState createState() => _ProductoBodyState();
}

class _ProductoBodyState extends State<ProductoBody> {
  ProductoModel producto;
  @override
  void didChangeDependencies() {
    producto = ModalRoute.of(context).settings.arguments;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 150,
            child: Image.asset(
              'assets/menu/header-tienda.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 15.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              color: Colors.brown[800],
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage(producto.img),
                          radius: 100,
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                producto.titulo,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.limeAccent,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Descripcion :',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.limeAccent[700],
                                ),
                              ),
                              Text(
                                producto.descripcion,
                                style: TextStyle(color: Colors.limeAccent),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Ingredientes :',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.limeAccent[700],
                                ),
                              ),
                              Text(
                                producto.ingredientes,
                                style: TextStyle(
                                  color: Colors.limeAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Card(
                  color: Colors.lightBlue,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.monetization_on,
                          color: Colors.white,
                        ),
                        Text(
                          ' Precio: ${producto.precio}',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightGreen,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.radio_button_checked,
                          color: Colors.white,
                        ),
                        Text(
                          ' Puntos: ${producto.puntos}',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
