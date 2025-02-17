import 'package:flutter/material.dart';
import 'package:noteable/core/utils/colors/app_colors.dart';
import 'package:noteable/core/utils/typography/app_fonts.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
  fontFamily: AppFonts.sfUiDisplay,
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryColor,
    elevation: 0,
    shape: CircleBorder(),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 0.85,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primaryColor,
        width: 1,
      ),
    ),
    labelStyle: const TextStyle(
      fontSize: 13,
      fontFamily: 'Lato',
    ),
    floatingLabelStyle: const TextStyle(
      color: AppColors.primaryColor,
      fontSize: 13,
      fontFamily: 'Lato',
    ),
    prefixIconColor: AppColors.primaryColor,
    suffixIconColor: AppColors.primaryColor,
  ),
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  
);
