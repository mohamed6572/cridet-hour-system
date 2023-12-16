import 'package:cridet_hour_system/pressentaion/resources/custom_widgets/payment_widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


AppBar buildAppBar({title,context}) {
  return AppBar(
    leading: InkWell(
      onTap: (){
       Navigator.pop(context);
      },
      child: Center(
        child: SvgPicture.asset('assets/icons/arrow_back.svg',
        ),
      ),
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      title??'',
      textAlign: TextAlign.center,
      style: Styles.style25,
    ),

  );
}