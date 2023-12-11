import 'package:cridet_hour_system/pressentaion/resources/color_manager.dart';
import 'package:flutter/material.dart';

class ContainerPersonData extends StatelessWidget {
  String text;
  ContainerPersonData({required this.text});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:Container(
        margin: EdgeInsets.symmetric(vertical: 5),
              padding:EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1,3),
                        blurRadius: 2,
                        spreadRadius: 1,
                        color: ColorManager.boxShadowColor)
                  ],
                  color:ColorManager.white),child:Text(text,style:Theme.of(context).textTheme.bodyMedium,textAlign:TextAlign.start,)
      ),
    );
  }
}
