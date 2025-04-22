import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import '../../../resources/Resources.dart';
import '../../Login/login screen.dart';
import '../../homescreen/home screen.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial()) {
    _CheckLoginStatus();
  }


  Future<void> _CheckLoginStatus() async{
    emit(SplashLoading());
    await initPrefs();
    final token = getPrefs();
    if (token != null && token.isNotEmpty  ) {
      emit(IsLoggedIn(token: token));
    } else {
      emit(IsNotLogged());

    }
  }
}
