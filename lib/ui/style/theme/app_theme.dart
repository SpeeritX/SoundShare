import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sound_share/ui/style/app_colors.dart';
import 'package:sound_share/ui/style/theme/app_text_theme.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: AppTextTheme.defaultFontFamily,
    textTheme: AppTextTheme.light,
    primaryColor: AppColors.primaryColor,
    cardColor: AppColors.white,
    shadowColor: AppColors.lightGray,
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.light,
      accentColor: AppColors.primaryColor,
      primarySwatch: Colors.yellow,
      cardColor: AppColors.white,
    ),
    backgroundColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      color: AppColors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.black,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: AppTextTheme.defaultFontFamily,
    textTheme: AppTextTheme.dark,
    cardColor: AppColors.gray,
    shadowColor: AppColors.gray,
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
      accentColor: AppColors.primaryColor,
      primarySwatch: Colors.yellow,
      cardColor: AppColors.darkGray,
    ),
    backgroundColor: AppColors.black,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: const AppBarTheme(
      color: AppColors.black,
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.white,
    ),
  );
}
