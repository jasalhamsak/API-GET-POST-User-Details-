
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? _prefs;
String? _token;

void _initPrefs()async{
  _prefs =await SharedPreferences.getInstance();
}

void _setPrefs(){
  _prefs?.setString("Token", "Tockennnnnnnxxxxxxx");
}

void _getPrefs(){
  _token =_prefs?.getString("Token");
}

void _remPrefs(){
  _prefs?.remove("Token");
}