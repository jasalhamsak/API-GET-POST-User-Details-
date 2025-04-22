

  import 'package:bloc/bloc.dart';
  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:meta/meta.dart';
  import 'package:http/http.dart'as http;

import '../../../resources/Resources.dart';
import '../Resources/Model.dart';

  part 'login_state.dart';

  class LoginCubit extends Cubit<LoginState> {
    LoginCubit(this.context) : super(LoginInitial());

     TextEditingController username =TextEditingController();
     TextEditingController password =TextEditingController();

     BuildContext context;
     String? token;
     login()async {
       try {
         emit(LoginInLoading());
         const url = "https://crm-beta-api.vozlead.in/api/v2/account/login/";
         final response = await http.post(Uri.parse(url), body: {
           "username": username.text,
           "password": password.text
           // "username": "sample@123.com",
           // "password": "123"
         }
         );
         if (response.statusCode == 200) {
           final data = postModelFromJson(response.body);
           final token = data.data.token;
           // Navigator.of(context).push(MaterialPageRoute(
           //   builder: (context) => homeScreen(token: token,),));

           await initPrefs();
           await setPrefs(token);
           getPrefs();


           emit(LoginInLoaded(data: data));
         } else {
           final errorData = postModelFromJson(response.body);
           emit(LoginInError());
         }
       }catch(e){
         emit(LoginInError());
         print(e);
       }
     }

  }
