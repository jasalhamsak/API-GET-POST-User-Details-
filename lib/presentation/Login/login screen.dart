import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../homescreen/home screen.dart';
import 'cubit/login_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => LoginCubit(context),
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginInLoaded) {
              final token = state.data.data.token;
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => homeScreen(token: token),
              ));
            } else if (state is LoginInError) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Username and Password Not Valid")));
            }
          },
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              final cubit = context.read<LoginCubit>();
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 450,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(150),
                        ),
                      ),
                      clipBehavior: Clip.hardEdge,
                      // Add this to make borderRadius apply to the image
                      child: Image(
                        image: AssetImage(
                            "assets/image1.jpg"), // Corrected asset path
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 250.0, top: 15),
                      child: Text("Sign In",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 70.0),
                      child: Text(
                        "Welcome back! Please Enter credential to login",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12, // subtle soft shadow
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: cubit.username,
                          decoration: InputDecoration(
                            hintText: "username",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12, // subtle soft shadow
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: cubit.password,
                          decoration: InputDecoration(
                            hintText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          if (cubit.username.text.isEmpty ||
                              cubit.password.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.red,
                                margin: EdgeInsets.all(10),
                                duration: Duration(seconds: 2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                content: Text(
                                  "Username and Password cannot be empty",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          } else {
                            cubit.login();
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: Container(
                              width: 370,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.blueAccent),
                              child: Center(
                                  child: state is LoginInLoading
                                      ? CircularProgressIndicator()
                                      : Text(
                                          "Sign In",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ))),
                        )),
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
