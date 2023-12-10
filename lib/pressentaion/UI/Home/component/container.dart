import 'package:cridet_hour_system/pressentaion/resources/color_manager.dart';
import 'package:flutter/material.dart';

class container extends StatelessWidget {
  String text;
 Icon icon;
  container({required this.icon,required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.only(top:10,bottom:10),
      width:MediaQuery.of(context).size.width*0.40,
      height:MediaQuery.of(context).size.height*0.18,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: ColorManager.white,boxShadow:[
        BoxShadow(
            offset: Offset(0,4),
            blurRadius: 2,
            spreadRadius: 1,
            color: ColorManager.boxShadowColor,),
      ]),
        child: Column(
          children: [
            Center(child:icon),
            SizedBox(height:10,),
            Center(child: Text(text,style:Theme.of(context).textTheme.bodyMedium)),
          ],
        ),
      );
  }
}
