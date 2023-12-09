import 'dart:async';
import 'dart:io';

import 'package:cridet_hour_system/pressentaion/UI/login/login.dart';
import 'package:cridet_hour_system/pressentaion/resources/constants_manager.dart';
import 'package:flutter/material.dart';

import '../control_panal/control_panal.dart';

class Splash_Screen extends StatelessWidget {
  static const String routeName='Splash_Screen';
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds:3),(){
      if(Platform.isWindows||Platform.isMacOS)
     AppConstants.navigateTo(context, ControlPanal());
      if(Platform.isAndroid||Platform.isIOS)
        AppConstants.navigateTo(context, Login_screen());
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

