import 'package:flutter/material.dart';
import 'package:sound_share/ui/style/app_colors.dart';

class AppTextTheme {
  static const defaultFontFamily = "Poppins";

  static final light = _defaultTheme.merge(const TextTheme(
    bodyText1: TextStyle(color: AppColors.blueGray),
    headline3: TextStyle(
      color: AppColors.blueGray,
    ),
    button: TextStyle(
      color: AppColors.white,
    ),
  ));

  static final dark = _defaultTheme.merge(const TextTheme(
    headline3: TextStyle(
      color: AppColors.lightGray,
    ),
    button: TextStyle(
      color: AppColors.gray,
    ),
  ));

  static const _defaultTheme = TextTheme(
    bodyText1: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    bodyText2: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
    subtitle1: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    headline1: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 60,
    ),
    headline2: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 30,
    ),
    headline3: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 20,
    ),
    headline4: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 16,
    ),
    button: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 18,
    ),
  );
}
