import 'package:cridet_hour_system/pressentaion/UI/App/payment/widgets/thank_you_card.dart';
import 'package:flutter/material.dart';

import 'custom_check_icon.dart';
import 'custom_dashed_line.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ThankYouCard(),
          Positioned(


              bottom: MediaQuery.of(context).size.height * 0.2 +20,
              left: 8+20,
              right: 8+20,
              child: CustomDashedLine()),
          Positioned(
            left: -20,
            bottom: MediaQuery.of(context).size.height * 0.2,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            right: -20,
            bottom: MediaQuery.of(context).size.height * 0.2,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          CustomCheckIcon()
        ],
      ),
    );
  }
}

