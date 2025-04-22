import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

Future<void> initPrefs()async{
  prefs =await SharedPreferences.getInstance();
}

Future<void> setPrefs(String token)async{
  if(prefs != null) {
    await prefs?.setString("Token_prefs", token);
  }
}
String? getPrefs(){

  final token = prefs?.getString("Token_prefs");
  return token;
}

Future<void> remPrefs()async{
  await prefs?.remove("Token_prefs");
}