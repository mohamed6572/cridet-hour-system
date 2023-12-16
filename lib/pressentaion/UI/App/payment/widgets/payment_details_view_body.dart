import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../resources/custom_widgets/payment_widgets/customButton.dart';
import '../thank_you_view.dart';
import 'PaymentMethoudsListView.dart';
import 'custom_creditcard.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({Key? key}) : super(key: key);

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode =AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: PaymentMethoudsListView()),
        SliverToBoxAdapter(child: CustomCreditcard(
          formKey: formKey,
            autovalidateMode: autovalidateMode
        )),
        SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
              padding: const EdgeInsets.only(bottom:12,right: 16,left: 16 ),
              child: customButton(onTap: () {
                if(formKey.currentState!.validate()){
                  formKey.currentState!.save();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ThankYouView(),));
                }else{

                  autovalidateMode=AutovalidateMode.always;

                  setState(() {

                  });
                }
              }, title: 'Pay'),
            ))),
      ],
    );
  }
}
