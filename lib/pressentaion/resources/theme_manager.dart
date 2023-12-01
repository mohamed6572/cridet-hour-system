import 'package:cridet_hour_system/pressentaion/resources/styles_manager.dart';
import 'package:cridet_hour_system/pressentaion/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData LightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.backGround,
    indicatorColor: ColorManager.primary,
    splashColor: Colors.transparent,
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(ColorManager.white),
      fillColor: MaterialStateProperty.all(ColorManager.primary),

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.primary,

          elevation: 0.0,

      selectedIconTheme: IconThemeData(
        color: ColorManager.white,
      ),
      unselectedIconTheme: IconThemeData(
        color: ColorManager.disable
      ),
      selectedItemColor: ColorManager.white,
      unselectedItemColor: ColorManager.disable,


    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.primary,
      centerTitle: true,
      elevation: 0,
      actionsIconTheme: IconThemeData(color: ColorManager.white),
    ),
    dividerColor: ColorManager.black,
    primaryColor: ColorManager.primary,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(1.0),
        backgroundColor: MaterialStateProperty.all(ColorManager.primary),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
            )
        )
        
      )
    ),

    buttonTheme: ButtonThemeData(
      buttonColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
            )
    ),
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(iconColor: MaterialStateProperty.all(ColorManager.white),
            elevation: MaterialStateProperty.all(1.0),
            backgroundColor: MaterialStateProperty.all(ColorManager.primary),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0), // Adjust the radius as needed
                )
            )

        )
    ),
    textTheme: TextTheme(
titleSmall: getRegularStyle(color: ColorManager.black,fontSize: FontSize.s12),
titleMedium: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s14),
titleLarge: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s16),
      displaySmall: getRegularStyle(color: ColorManager.black,fontSize: FontSize.s14),
      displayMedium: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s18),
      displayLarge: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s20),
      bodySmall: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s16),
      bodyMedium: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s20),
      bodyLarge: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s25),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      //hint style
      hintStyle:
      getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      //label style
      labelStyle:
      getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      errorStyle: getRegularStyle(color: ColorManager.error),
      //enable border style
      enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: ColorManager.border, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.s12),
          )),
      //focused border style
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.s12),
          )),
      //error border style
      errorBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: ColorManager.error, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.s12),
          )),
      //focused error border style

      focusedErrorBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.s12),
          )),
    ),


  );
}
