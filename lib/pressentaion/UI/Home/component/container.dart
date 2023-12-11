import 'package:cridet_hour_system/pressentaion/resources/color_manager.dart';
import 'package:flutter/material.dart';

class container extends StatelessWidget {
  String text;
 Icon icon;
 void Function()? onTap;
  container({required this.icon,required this.text,required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              SizedBox(height:10,),
              Text(text,style:Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),
            ],
          ),
        ),
    );
  }
}
