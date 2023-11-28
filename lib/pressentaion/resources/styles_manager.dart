import 'package:flutter/material.dart';
import 'color_manager.dart';
import 'font_manager.dart';



TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight);
}

//regular style
TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWightManager.regular, color);
}
//medium style
TextStyle getMediumStyle(
    {double fontSize = FontSize.s16, required Color color}) {
  return _getTextStyle(fontSize, FontWightManager.medium, color);
}
//light style
TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWightManager.light, color);
}
//bold style
TextStyle getBoldStyle(
    {double fontSize = FontSize.s20, required Color color}) {
  return _getTextStyle(fontSize, FontWightManager.bold, color);
}//semibold style
TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s14, required Color color}) {
  return _getTextStyle(fontSize, FontWightManager.semiBold, color);
}
TextStyle getMore_botton_textStyle(

)=>  TextStyle(color: ColorManager.darkGrey, fontWeight: FontWightManager.medium,decoration: TextDecoration.underline,
  fontSize: FontSize.s14);
TextStyle More_botton_link_textStyle(
)=>  TextStyle(color: ColorManager.primary, fontWeight: FontWightManager.medium,   decoration: TextDecoration.underline,
  fontSize: FontSize.s16);