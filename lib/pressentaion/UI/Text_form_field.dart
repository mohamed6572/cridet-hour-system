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
            decoration: InputDecoration(
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                errorBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                hintText: hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .titleMedium!,
                suffixIcon: suffixIcon),
            style: TextStyle(
              color: ColorManager.black,
            ),
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
