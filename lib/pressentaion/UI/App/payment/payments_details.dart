import 'package:cridet_hour_system/app/cubit/cubit.dart';
import 'package:cridet_hour_system/app/cubit/state.dart';
import 'package:cridet_hour_system/pressentaion/UI/App/payment/widgets/payment_details_view_body.dart';
import 'package:cridet_hour_system/pressentaion/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/constants_manager.dart';
import '../Home/home_screen.dart';


class PaymentsDetailsView extends StatelessWidget {
  const PaymentsDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
       if(state is PaySuccsesState ){
         AppConstants.navigateToAndFinish(context, HomeScreen());

       }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(
            'Payment Details', style: TextStyle(color: ColorManager.white),)),
          body: PaymentDetailsViewBody(),
        );
      },
    );
  }
}
