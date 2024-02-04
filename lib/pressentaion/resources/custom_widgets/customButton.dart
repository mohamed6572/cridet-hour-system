
import 'package:flutter/material.dart';

import '../styles.dart';


class customButton extends StatelessWidget {
  final String title;
  final bool isLoading;

  final void Function()? onTap;

  const customButton({
    super.key,
    required this.onTap,
    required this.title,  this.isLoading =false
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: ShapeDecoration(
          color: Color(0xFF34A853),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child:isLoading ? CircularProgressIndicator(): Text(
            title,
            textAlign: TextAlign.center,
            style: Styles.style22,
          ),
        ),
      ),
    );
  }
}