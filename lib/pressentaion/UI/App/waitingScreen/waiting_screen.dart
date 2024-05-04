import 'package:cridet_hour_system/app/cubit/cubit.dart';
import 'package:cridet_hour_system/app/cubit/state.dart';
import 'package:cridet_hour_system/pressentaion/UI/App/Home/home_screen.dart';
import 'package:cridet_hour_system/pressentaion/resources/color_manager.dart';
import 'package:cridet_hour_system/pressentaion/resources/constants_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../payment/payments_details.dart';

class WaitingScreen extends StatefulWidget {
  const WaitingScreen({Key? key}) : super(key: key);

  @override
  State<WaitingScreen> createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is getUserSuccsesState &&
            AppCubit.get(context).student_model!.isApproved == true)
          AppCubit.get(context).student_model!.isPaid == true
              ? AppConstants.navigateToAndFinish(context, HomeScreen())
              : AppConstants.navigateToAndFinish(
                  context, PaymentsDetailsView());
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorManager.warning,
          ),
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(15)),
              width: double.infinity,
              height: 250,
              margin: EdgeInsets.all(30),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.warning_amber_outlined,
                    color: ColorManager.warning,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Please Wait Until You Get Approve From student affairs .',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        AppCubit.get(context).getUserData();
                      },
                      child: Text('Refresh')),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
