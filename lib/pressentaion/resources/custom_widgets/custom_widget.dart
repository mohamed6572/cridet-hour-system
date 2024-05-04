import 'package:flutter/material.dart';

import '../Lists_manager.dart';
import '../color_manager.dart';
import '../values_manager.dart';

Widget squad_appBar (context,text)=>Container(
width:  double.infinity,
padding: EdgeInsets.symmetric(vertical: 15),
color: ColorManager.primary,
child: Center(child: Text(text,style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ColorManager.white),)),
);
Widget squad_body (index)=>Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [

    Text(Lists_Manager.YearText[index]),

    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Divider(
        thickness: 2,
        height: 40,
        color: ColorManager.black,
      ),
    )
  ],
);
Size mediaquery (context) => MediaQuery.of(context).size;
Widget defult_container ({required Widget child,  h,mh,w,mv,ph,pv,color}) =>  Container(
  margin: EdgeInsets.symmetric(horizontal: mh??8.0,vertical:  mv??0.0),
  padding: EdgeInsets.symmetric(horizontal: ph??8.0 ,vertical:  pv??0.0),
  height:h,
  width:w ??  double.infinity ,
  decoration: BoxDecoration(
    color: color??ColorManager.white,
    borderRadius: BorderRadius.circular(15.0),
    boxShadow: [
      BoxShadow(
        color: ColorManager.boxShadowColor,
        spreadRadius: 1,
        blurRadius: 2,
        offset: Offset(0, 4),
      ),
    ],
  ),
  child: child,
);

Widget def_TextFormField(
    {controller,
      maxLines,
      validator,
      context,
      focusNode,
      onFieldSubmitted,
      hintText,
      horizontal,
      TextInputType? type,
      String? label,
      IconData? prefix,
      IconData? suffix,
      bool isPassword = false,
      void Function(String val)? onChanged,
      required void Function(PointerDownEvent )? onTapOutside,
      VoidCallback? passwordShow,
      VoidCallback? onTap,
      void Function(String)? onSubmeted,
      virtical}) =>
    Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontal == null ? AppMargin.m20 : horizontal,
          vertical: virtical == null ? 0 : virtical),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: TextFormField(
          controller: controller,
          cursorColor: ColorManager.primary,
          maxLines: maxLines,
          minLines: 1,
          onTap: onTap,
          onFieldSubmitted: onSubmeted,
          onChanged: onChanged,
          obscureText: isPassword,
          validator: validator,
          onTapOutside: onTapOutside,
          focusNode: focusNode,style: Theme.of(context).textTheme.bodyMedium,
          keyboardType: type,
          decoration: InputDecoration(hintText: hintText,
            labelText: label,

            prefixIcon: Icon(prefix,color: ColorManager.primary),
            suffixIcon:  suffix != null ? IconButton(icon: Icon(suffix) , onPressed: passwordShow,) : null,),
        ),
      ),
    );
Widget defult_button ({required  text,required  context,required  color,required  tcolor,required h,required w,required B,required onTap}) =>      ElevatedButton(

  onPressed: onTap,

  style: ButtonStyle(
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(B), // Adjust the radius as needed
          )
      ),

      fixedSize: MaterialStateProperty.all(Size(w, h)),
      backgroundColor: MaterialStateProperty.all(color)
  ),
  child:Text('$text',style: Theme.of(context).textTheme.bodySmall!.copyWith(color: tcolor),), );

AppBar app_AppBar({String? text = 'HIMIT', context})=>  AppBar(

  centerTitle: true,
  title: Text(text?? 'HIMIT',
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(color: ColorManager.white)),
);