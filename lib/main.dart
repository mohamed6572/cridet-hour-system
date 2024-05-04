
import 'package:bloc/bloc.dart';
import 'package:cridet_hour_system/pressentaion/resources/Bloc_Observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app/MyApp.dart';
import 'dart:io';

void main() {

  BlocOverrides.runZoned(
        () async {
      WidgetsFlutterBinding.ensureInitialized();
       await Firebase.initializeApp();
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );

}


