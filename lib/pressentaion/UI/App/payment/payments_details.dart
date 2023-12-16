import 'package:cridet_hour_system/pressentaion/UI/App/payment/widgets/payment_details_view_body.dart';
import 'package:flutter/material.dart';

import '../../../resources/custom_widgets/payment_widgets/custom_app_bar.dart';
class PaymentsDetailsView extends StatelessWidget {
  const PaymentsDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Payment Details',context: context),
      body: PaymentDetailsViewBody(),
    );
  }
}
