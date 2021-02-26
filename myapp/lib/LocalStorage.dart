import 'package:shared_preferences/shared_preferences.dart';

setInt(String value) async {
  SharedPreferences myPrefs = await SharedPreferences.getInstance();
  myPrefs.setString('number', value);
}

Future<String> getDigits() async {
  SharedPreferences myPrefs = await SharedPreferences.getInstance();
  return myPrefs.getString('number');
}
