import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle ({
  required double fontSize ,
  required FontWeight fontWeight ,
  required Color color,

})
{
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: FontConstants.fontFamily,
    color: color,
  );
}

// light style
TextStyle getLightStyle({
  double fontSize = FontSize.s16,
  required Color color ,
})
{
  return _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.light,
      color: color
  );
}

// regularStyle
TextStyle getRegularStyle({
  double fontSize = FontSize.s18,
  required Color color ,
})
{
  return _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.regular,
      color: color
  );
}

// medium style
TextStyle getMediumStyle({
  double fontSize = FontSize.s20,
  required Color color ,
})
{
  return _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.medium,
      color: color
  );
}

// semi bold style
TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s22,
  required Color color ,
})
{
  return _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.semiBold,
      color: color
  );
}

// bold style
TextStyle getBoldStyle({
  double fontSize = FontSize.s28,
  required Color color ,
})
{
  return _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.bold,
      color: color
  );
}