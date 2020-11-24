import 'package:shared_preferences/shared_preferences.dart';
import 'package:cafe_mas/Services/FirebaseServices.dart';

const loginKey = 'cafemasLogged';
const phoneKey = 'cafemasPhone';
String currentPhone;

Future<int> autoLogin() async {
  int i;
  final SharedPreferences cfg = await SharedPreferences.getInstance();
  bool login = cfg.getBool(loginKey);
  String phone = cfg.getString(phoneKey);
  if (login && phone.isNotEmpty) {
    currentPhone = cfg.getString(phoneKey);

    //Analizar si el documneto existe o si esta en blanco
    bool doc = await checkIfDocIsBlank();
    if (doc) {
      i = 1;
    } else {
      i = 2;
    }
  } else {
    i = 0;
  }
  return i;
}

Future<Null> loginUser(String phone) async {
  final SharedPreferences cfg = await SharedPreferences.getInstance();
  cfg.setBool(loginKey, true);
  cfg.setString(phoneKey, phone);
}

Future<Null> logOut() async {
  final SharedPreferences cfg = await SharedPreferences.getInstance();
  cfg.setBool(loginKey, false);
  cfg.setString(phoneKey, '');
}

Future<String> getPhoneUser() async {
  final SharedPreferences cfg = await SharedPreferences.getInstance();
  return cfg.getString(phoneKey);
}
