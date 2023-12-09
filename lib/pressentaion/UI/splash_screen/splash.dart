import 'dart:async';
import 'dart:io';

import 'package:cridet_hour_system/pressentaion/UI/login/login.dart';
import 'package:cridet_hour_system/pressentaion/resources/constants_manager.dart';
import 'package:flutter/material.dart';

import '../control_panal/control_panal.dart';

class Splash_Screen extends StatefulWidget {
  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 3), _goNext);
  }
  _goNext() {
    if(Platform.isWindows||Platform.isMacOS)
      AppConstants.navigateToAndFinish(context, ControlPanal());

    if(Platform.isAndroid||Platform.isIOS)
      AppConstants.navigateToAndFinish(context, Login_screen());


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _startDelay();
  }
  @override
  Widget build(BuildContext context) {





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

