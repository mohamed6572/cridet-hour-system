
import 'package:flutter/material.dart';

import '../../../../resources/styles.dart';


class PaymentItemInfo extends StatelessWidget {
  PaymentItemInfo({super.key, required this.title, required this.value});
  final String title,value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style:Styles.style18,
        ),
        Text(
            value,
            style: Styles.styleBold18)
      ],
    );
  }
}