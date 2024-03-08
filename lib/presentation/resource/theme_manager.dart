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
      iconTheme: IconThemeData(
        size: AppSize.s25,
        color: ColorManager.white
      ),
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.shadow,
      titleTextStyle: getSemiBoldStyle(
          color: ColorManager.white,
          fontSize: FontSize.s25
      ),
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
          foregroundColor: ColorManager.white,
          textStyle:getButtonStyle(
              color: ColorManager.white,
              fontSize: FontSize.s25
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s18)
          ),
          backgroundColor: ColorManager.primary
      ),
    ),

    // text theme
    textTheme: TextTheme(
      // for splash and on boarding
      displayLarge: getBoldStyle(
          color: ColorManager.primary,
          fontSize: FontSize.s60
      ),

      headlineLarge: getSemiBoldStyle(
          color: ColorManager.gray,
          fontSize: FontSize.s30
      ),

      // for titles
      titleLarge: getBoldStyle(
          color: ColorManager.primary,
          fontSize: FontSize.s40
      ),
      titleMedium: getSemiBoldStyle(
          color: ColorManager.white,
          fontSize: FontSize.s25
      ),

      // for body
      headlineMedium: getMediumStyle(
          color: ColorManager.primary ,
          fontSize: FontSize.s40
      ),
      bodyLarge: getRegularStyle(
          fontSize:FontSize.s30 ,
          color: ColorManager.title
      ),
      bodyMedium: getMediumStyle(
          color: ColorManager.primary,
          fontSize: FontSize.s22
      ),

      // for text arabic
      displayMedium: getBoldArabicStyle(
          color: ColorManager.primary,
          fontSize: FontSize.s30
      ),
      bodySmall: getSemiBoldArabicStyle(
          color: ColorManager.title,
          fontSize: FontSize.s25
      ),
      headlineSmall:  getMediumArabicStyle(
          color: ColorManager.darkGray,
          fontSize: FontSize.s20
      ),

    ),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      // content padding
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle:
        getRegularStyle(color: ColorManager.gray, fontSize: FontSize.s16),
        labelStyle:
        getMediumStyle(color: ColorManager.title, fontSize: FontSize.s20),
        errorStyle: getRegularStyle(color: ColorManager.error , fontSize: FontSize.s14),
        suffixIconColor: ColorManager.primary,

        // border
        border: const OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.gray, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s16))),
        // enabled border style
        enabledBorder: const OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.gray, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s16))),

        // focused border style
        focusedBorder: const OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s16))),

        // error border style
        errorBorder: const OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s16))),
        // focused border style
        focusedErrorBorder: const OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s16))
        ),
    ),
  );
}