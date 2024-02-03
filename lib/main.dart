
import 'package:bloc/bloc.dart';
import 'package:cridet_hour_system/pressentaion/resources/Bloc_Observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app/MyApp.dart';
import 'dart:io';
import 'package:window_size/window_size.dart';

void main() {

  BlocOverrides.runZoned(
        () async {
      WidgetsFlutterBinding.ensureInitialized();
      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        setWindowTitle('Credit Hour System');
        setWindowMinSize(const Size(1834.0, 720));

      }


       await Firebase.initializeApp();

      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );

}


