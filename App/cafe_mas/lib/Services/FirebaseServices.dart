import 'package:cafe_mas/Data/SharedKeys.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> checkIfDocExist() async {
  bool exist;
  await FirebaseFirestore.instance
      .collection('clientes')
      .doc(currentPhone)
      .get()
      .then((doc) {
    if (doc.exists) {
      print('Doc Exits');
      exist = true;
      //print(doc.data());
    } else {
      print('Doc not exist -> Goto enter info');
      exist = false;
    }
  });
  return exist;
}

Future<bool> checkIfDocIsBlank() async {
  bool validar = true;
  String str;
  await FirebaseFirestore.instance
      .collection('clientes')
      .doc(currentPhone)
      .get()
      .then((doc) {
    if (doc.exists) {
      Map<String, dynamic> data = doc.data();
      print('DEBUG: Analizando datos del documento');
      data.forEach((key, value) {
        print('$key: $value');
        str = value.toString();

        if (str.isEmpty || str == null) {
          print('Validacion Fail: $key: $str');
          validar = false;
        }
      });

      //Map petromed
      if (data['petromed'] != null) {
        print('Sub item petromed');
        data['petromed'].forEach((k, v) {
          print('\t$k: $v');
          if (str.isEmpty || str == null) {
            print('Validacion Fail: $k: $str');
            validar = false;
          }
        });
      }

      //Map cafemas
      if (data['cafemas'] != null) {
        print('Sub item cafemas');
        data['cafemas'].forEach((k, v) {
          print('\t$k: $v');
          if (str.isEmpty || str == null) {
            print('Validacion Fail: $k: $str');
            validar = false;
          }
        });
      }
      print('Proceso terminado, Validacion: $validar');
    } else {
      validar = false;
    }
  });
  return validar;
}

//Cargar datos
Future<Map<String, dynamic>> cargarDatos() async {
  //Checar si el documento existe
  bool docExist = await checkIfDocExist();
  Map<String, dynamic> data = {
    'nombre': '',
    'puntos': '',
    'petromed': {'correo': '', 'direccion': '', 'razon_social': '', 'rfc': ''},
    'cafemas': {'correo': '', 'direccion': '', 'razon_social': '', 'rfc': ''},
  };

  //Si el documento existe
  if (docExist) {
    await FirebaseFirestore.instance
        .collection('clientes')
        .doc(currentPhone)
        .get()
        .then((doc) {
      data = doc.data();
      return data;
    }).catchError((onError) {
      print(onError);
    });
  } else {
    await FirebaseFirestore.instance
        .collection('clientes')
        .doc(currentPhone)
        .set(data)
        .then((doc) {
      print('Carga Ok');
      return data;
    }).catchError((e) {
      print(e);
    });
  }
  return data;
}

Future<bool> testDoc() async {
  //El documento no existe
  await FirebaseFirestore.instance
      .collection('clientes')
      .doc(currentPhone)
      .set({
    'nombre': '',
    'puntos': 135,
    'petromed': {'correo': '', 'direccion': '', 'razon_social': '', 'rfc': ''},
    'cafemas': {'correo': '', 'direccion': '', 'razon_social': '', 'rfc': ''},
  }).then((value) {
    print('Carga Ok');
    return true;
  }).catchError((e) {
    print(e);
    return false;
  });
}

//Upload new doc
Future<bool> newDoc({Map<String, dynamic> m}) async {
  bool validacion = false;

  await FirebaseFirestore.instance
      .collection('clientes')
      .doc(currentPhone)
      .set(m)
      .then((value) {
    validacion = true;
  }).catchError((e) {
    validacion = false;
  });

  return validacion;
}

//Upload existing doc
Future<bool> updateDoc({Map<String, dynamic> m}) async {
  Map<String, dynamic> buffer = m;
  buffer.remove('puntos');
  bool validacion = false;

  await FirebaseFirestore.instance
      .collection('clientes')
      .doc(currentPhone)
      .update(m)
      .then((_) {
    validacion = true;
  }).catchError((e) {
    validacion = false;
  });
  return validacion;
}
