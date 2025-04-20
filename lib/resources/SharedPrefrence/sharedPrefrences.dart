
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? _prefs;

void _initPrefs()async{
  _prefs =await SharedPreferences.getInstance();
  
}