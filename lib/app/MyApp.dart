import 'package:cridet_hour_system/app/cubit/cubit.dart';
import 'package:cridet_hour_system/app/cubit/state.dart';
import 'package:cridet_hour_system/pressentaion/UI/Absence/absence_presence.dart';
import 'package:cridet_hour_system/pressentaion/UI/App/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pressentaion/UI/App/Home/home_screen.dart';
import '../pressentaion/UI/App/Register/register.dart';
import '../pressentaion/UI/App/payment/payments_details.dart';
import '../pressentaion/UI/App/waitingScreen/waiting_screen.dart';
import '../pressentaion/resources/theme_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getUserData(context:context)..Get_All_Subject(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {

          print( FirebaseAuth.instance.idTokenChanges().listen((event) {event?.getIdToken();}));
          return MaterialApp(
            home: FirebaseAuth.instance.currentUser != null
                ? AppCubit.get(context).student_model?.isApproved == false
                    ? WaitingScreen()
                    : AppCubit.get(context).student_model?.isPaid == false
                        ? PaymentsDetailsView()
                        : HomeScreen()
                : Login_screen(),
            title: 'Cridet Hour Sytem',
            debugShowCheckedModeBanner: false,
            theme: LightTheme(),
          );
        },
      ),
    );
  }
}
