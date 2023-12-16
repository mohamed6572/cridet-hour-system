import 'package:cridet_hour_system/pressentaion/UI/App/payment/widgets/thank_you_view_body.dart';
import 'package:flutter/material.dart';

import '../../../resources/custom_widgets/payment_widgets/custom_app_bar.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:buildAppBar(context: context),
      body: Transform.translate(
        offset: Offset(0,-16),
          child: ThankYouViewBody()),
    );
  }
}
