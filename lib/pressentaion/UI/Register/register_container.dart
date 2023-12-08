import 'package:cridet_hour_system/pressentaion/resources/color_manager.dart';
import 'package:flutter/material.dart';

class RegisterContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(30),color: ColorManager.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400, // Color of the shadow
            offset: Offset(0, 2), // Offset of the shadow
            blurRadius: 4, // Spread of the shadow
            spreadRadius: 0, // Extent of the shadow
          ),
        ],),
      width: 50,
      height: 30,
      child: IconButton(onPressed: (){},icon: Icon(Icons.ios_share_outlined,color: ColorManager.white,size: 15,),),
    );
  }
}
