import 'dart:async';

import 'package:cridet_hour_system/pressentaion/UI/login/login.dart';
import 'package:flutter/material.dart';

class Splash_Screen extends StatelessWidget {
  static const String routeName='Splash_Screen';
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds:3),(){
      Navigator.of(context).pushNamed(Login_screen.routeName);
    });
    return Scaffold(
      body:
      Center(
        child: Image.asset(
          'assets/images/logo.png'
          ,width:MediaQuery.of(context).size.height*0.4,
        height:MediaQuery.of(context).size.width*0.4,
        ),
      ),
    );
  }
}

