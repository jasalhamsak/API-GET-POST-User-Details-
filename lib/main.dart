import 'package:apigetandpost/presentation/Login/login%20screen.dart';
import 'package:apigetandpost/presentation/SplashScreen/Presentation/Splash.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API GET & POST',
      home: Splash(),
    );
  }
}
