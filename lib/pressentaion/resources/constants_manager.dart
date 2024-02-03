
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';

class AppConstants{
  static int controlPanal_Screens_Index = 0;
  static bool controlPanal_photoOrdata = false;
  static def_divider() => Divider(
    thickness: 1.5,
    color: ColorManager.primary,
  );

  static void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));

  static  void navigateToAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
          (route) => false);


  static void exitApp() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }
  static AppBar defult_appBar({title, required context}) => AppBar(
    title: Text('$title',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ColorManager.white),),
    centerTitle: true,

  );


}

// const firebaseConfig = {
//   apiKey: "AIzaSyAQwbU05l6BIkOCapYyseewjNxckIcTsuw",
//   authDomain: "cridet-hour-system.firebaseapp.com",
//   projectId: "cridet-hour-system",
//   storageBucket: "cridet-hour-system.appspot.com",
//   messagingSenderId: "189285904403",
//   appId: "1:189285904403:web:3eb3580b825750b2f14fe6"
// };

