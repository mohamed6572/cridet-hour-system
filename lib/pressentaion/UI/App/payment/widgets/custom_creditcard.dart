 import 'package:cridet_hour_system/app/cubit/cubit.dart';
import 'package:cridet_hour_system/pressentaion/UI/App/payment/widgets/vodafone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../../../../resources/constants_manager.dart';

class CustomCreditcard extends StatefulWidget {
  CustomCreditcard({Key? key, required this.formKey, required this.autovalidateMode}) : super(key: key);
  final GlobalKey<FormState> formKey ;
 final  AutovalidateMode autovalidateMode ;

  @override
  State<CustomCreditcard> createState() => _CustomCreditcardState();
}

class _CustomCreditcardState extends State<CustomCreditcard> {
   String cardNumber = '',
      expiryDate = '',
      cardHolderName = '',
      cvvCode = '';

   bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(AppCubit.get(context).isCard)
        CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: showBackView,
            isHolderNameVisible: true,
            onCreditCardWidgetChange: (v) {}),
        if( AppCubit.get(context).isCard)
        CreditCardForm(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            autovalidateMode:    widget.autovalidateMode,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (creditCardModel) {
              cardNumber = creditCardModel.cardNumber;
              expiryDate = creditCardModel.expiryDate;
              cardHolderName = creditCardModel.cardHolderName;
              cvvCode = creditCardModel.cvvCode;
              showBackView = creditCardModel.isCvvFocused;
              setState(() {

              });
            },
            formKey: widget.formKey),
        if( !AppCubit.get(context).isCard)
          VodafoneWidget()
      ],
    );
  }
}
