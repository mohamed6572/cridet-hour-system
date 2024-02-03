import 'package:cridet_hour_system/pressentaion/resources/color_manager.dart';
import 'package:flutter/material.dart';

class RegisterContainer extends StatelessWidget {
  Function()? onTap ;
  RegisterContainer(
  {required this.onTap

}
      );
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(30),color: ColorManager.primary,
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
        child:  Icon(Icons.ios_share_outlined,color: ColorManager.white,size: 15,)
      ),
    );
  }
}
