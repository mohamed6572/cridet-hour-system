import 'package:cridet_hour_system/pressentaion/UI/App/payment/widgets/payment_details_item.dart';
import 'package:cridet_hour_system/pressentaion/resources/constants_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../app/cubit/cubit.dart';

class PaymentMethoudsListView extends StatefulWidget {
  PaymentMethoudsListView({super.key});

  @override
  State<PaymentMethoudsListView> createState() => _PaymentMethoudsListViewState();
}

class _PaymentMethoudsListViewState extends State<PaymentMethoudsListView> {
  List<String> paymentMethoudsItems = [
    'assets/icons/card.svg',
    'assets/icons/vodafone.svg'
  ];
int activeIndex =0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentMethoudsItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: (){
                activeIndex=index;
                setState(() {

                  AppCubit.get(context).ChangeCard(index);
                });
              },
              child: PaymentMethoudItem(
                isActive: activeIndex==index,
                image: paymentMethoudsItems[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
