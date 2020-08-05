import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardWallet extends StatefulWidget {
  @override
  _CardWalletState createState() => _CardWalletState();
}

class _CardWalletState extends State<CardWallet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.orange,
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
              color: Colors.orange[400],
              image: DecorationImage(
                image: AssetImage('assets/logo_gulf2.png'),
                fit: BoxFit.contain,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.1), BlendMode.dstIn),
              ),
            ),
            height: 220,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Gulf wallet - Xalapa',
                        style: TextStyle(fontSize: 28, color: Colors.white),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.orange[400],
                        backgroundImage: AssetImage('assets/codigo-qr.png'),
                        //radius: 18,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '125.00 Puntos',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Icon(
                        Icons.replay,
                        color: Colors.white,
                        size: 38,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'PetroMed S.A. de C.V.',
                        style: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Nombre de Usuario',
                        style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    color: Colors.grey[300],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
