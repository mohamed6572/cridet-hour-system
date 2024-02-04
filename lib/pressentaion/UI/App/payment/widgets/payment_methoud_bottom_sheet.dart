
import 'package:flutter/material.dart';

import 'PaymentMethoudsListView.dart';
import 'custom_button_bloc_consumer.dart';

class PaymentMethoudsBottomSheet extends StatelessWidget {
  const PaymentMethoudsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16,),
          PaymentMethoudsListView(),
          SizedBox(height: 32,),
          CustomButtonBlocConsumer()
        ],
      ),
    );
  }
}
