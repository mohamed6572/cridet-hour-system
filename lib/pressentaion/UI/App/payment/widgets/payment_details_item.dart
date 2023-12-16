import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethoudItem extends StatelessWidget {
 final bool isActive;
 final String image;

  const PaymentMethoudItem({
    super.key,
    required this.isActive, required this.image
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.50, color:isActive ? Color(0xFF34A853) :Colors.grey ),
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: [
          BoxShadow(
            color: isActive ? Color(0xFF34A853) :Colors.white ,
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Center(child: SvgPicture.asset(image,)),
      ),
    );
  }
}
