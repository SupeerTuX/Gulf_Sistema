import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CollectionReference users = FirebaseFirestore.instance.collection('clientes');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'You are logeed in succesfully',
              style: TextStyle(color: Colors.lightBlue, fontSize: 32),
            ),
            SizedBox(height: 16),
            Text(
              'Phone: ',
              style: TextStyle(color: Colors.grey),
            ),
            FutureBuilder<DocumentSnapshot>(
              future: users.doc('+522282536722').get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data = snapshot.data.data();
                  print(data);
                  return Text("Full Name: ");
                }
                return Text("loading");
              },
            ),
            //? Get Data
            RaisedButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('clientes')
                    .get()
                    .then((querySnapshot) {
                  print('Clientes');
                  querySnapshot.docs.forEach((element) {
                    print(element.id);
                    print(element.data());
                  });
                });
              },
              child: Text('Get Data'),
            ),
            //? Set Data
            RaisedButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('clientes')
                    .doc('+522282778899')
                    .set({
                  'correo': 'narbe@gmail.com',
                  'nombre': 'Narberal Mendoza',
                  'puntos': 250
                }).then((value) {
                  print('Carga Ok');
                });
              },
              child: Text('Set Data'),
            ),
            //? Update date
            RaisedButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('clientes')
                    .doc('+522282778899')
                    .update({'puntos': 252}).then((value) {
                  print('Actualizado OK');
                });
              },
              child: Text('Update Data'),
            ),
            //! Delete Data
            RaisedButton(
              onPressed: () {},
              child: Text('Delete Data'),
            ),
          ],
        ),
      ),
    );
  }
}
