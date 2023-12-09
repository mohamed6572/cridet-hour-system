import 'package:cridet_hour_system/pressentaion/resources/color_manager.dart';
import 'package:flutter/material.dart';

class textFormField extends StatelessWidget {
  String hintText;
  Widget? suffixIcon;
  bool isObscure;
  var keyboardType;
  String? Function(String?) validator;
  TextEditingController controller;

  textFormField(
      {
      required this.hintText,
      this.suffixIcon,
      this.isObscure = false,
      required this.validator,
      required this.controller,
      this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:EdgeInsets.all(15),
          child: TextFormField(


            validator: validator,
            controller: controller,
            obscureText: isObscure,
            keyboardType: keyboardType,
          ),
        ),
      ],
    );
  }
}
