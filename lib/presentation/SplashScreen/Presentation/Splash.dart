import 'package:apigetandpost/presentation/Login/login%20screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../homescreen/home screen.dart';
import '../cubic/splash_cubit.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SplashCubit(),
        child: BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if(state is IsLoggedIn){
              WidgetsBinding.instance.addPostFrameCallback((_){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => homeScreen(token: state.token),));
              });
            }else if(state is IsNotLogged){
              WidgetsBinding.instance.addPostFrameCallback((_){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage(),));
              });
            }
          },
          child: BlocBuilder<SplashCubit, SplashState>(
            builder: (context, state) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("CodeMe Hub",
                      style: TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold),)
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
