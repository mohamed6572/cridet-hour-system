import 'package:cridet_hour_system/app/cubit/cubit.dart';
import 'package:cridet_hour_system/app/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            //home : name of widget
            title: 'Cridet Hour Sytem',
            debugShowCheckedModeBanner: false,

          );
        },
      ),
    );
  }
}
