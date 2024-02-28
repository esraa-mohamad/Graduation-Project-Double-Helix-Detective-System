import 'package:double_helix_detective_system/presentation/resource/style_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/values_manager.dart';
import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
  //main colors
    primaryColor: ColorManager.primary,

    cardTheme: const CardTheme(
        color: ColorManager.background,
        shadowColor: ColorManager.shadow,
        elevation: AppSize.s4
    ),

    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.shadow,
      titleTextStyle:
      getRegularStyle(
          fontSize: FontSize.s18,
          color: ColorManager.title),
    ),

    // button theme
    buttonTheme: const ButtonThemeData(
        shape: StadiumBorder(),
        disabledColor: ColorManager.background,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.shadow,
    ),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
            color: ColorManager.lightBackground,
            fontSize: FontSize.s25
        ),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s20)
        ),
      ),
    ),

    // text theme
    textTheme: TextTheme(
        displayLarge: getBoldStyle(
            color: ColorManager.primary,
            fontSize: FontSize.s60
        ),
        headlineLarge: getSemiBoldStyle(
            color: ColorManager.gray,
            fontSize: FontSize.s30
        ),
        headlineMedium: getMediumStyle(
            color: ColorManager.gray ,
            fontSize: FontSize.s40
        ),
        titleMedium: getMediumStyle(
            color: ColorManager.primary,
            fontSize: FontSize.s22
        ),
        bodyLarge: getRegularStyle(fontSize:FontSize.s18 , color: ColorManager.primary),
        bodySmall: getRegularStyle(fontSize:FontSize.s16 ,color: ColorManager.gray)),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      // content padding
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle:
        getRegularStyle(color: ColorManager.gray, fontSize: FontSize.s16),
        labelStyle:
        getMediumStyle(color: ColorManager.title, fontSize: FontSize.s20),
        errorStyle: getRegularStyle(color: ColorManager.error),

        // border
        border: const OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s20))),
        // enabled border style
        enabledBorder: const OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s20))),

        // focused border style
        focusedBorder: const OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.gray, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s20))),

        // error border style
        errorBorder: const OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s20))),
        // focused border style
        focusedErrorBorder: const OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)))),
  );
}