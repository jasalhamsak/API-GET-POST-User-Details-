import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Text("CodeMe Hub",style:TextStyle(fontSize: 40,fontWeight: FontWeight.bold) ,)
        ],
      ),
    );
  }
}
