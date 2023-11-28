import 'package:cridet_hour_system/app/cubit/cubit.dart';
import 'package:cridet_hour_system/app/cubit/state.dart';
import 'package:cridet_hour_system/pressentaion/UI/control_panal/control_panal.dart';
import 'package:cridet_hour_system/pressentaion/UI/login/login.dart';
import 'package:cridet_hour_system/pressentaion/UI/splash_screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pressentaion/resources/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return MaterialApp(
            //
            home : ControlPanal(),
            title: 'Cridet Hour Sytem',
            debugShowCheckedModeBanner: false,
            theme: LightTheme(),

          );
        },
      ),
    );
  }
}
