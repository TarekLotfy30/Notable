import 'package:flutter/material.dart';
import '../colors/app_colors.dart';
import '../typography/app_fonts.dart';
import '../typography/app_text_styles.dart';
import '../typography/font_weight_helper.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    primary: AppColors.primaryColor,
    seedColor: AppColors.primaryColor,
    brightness: Brightness.light,
    onSurface: AppColors.black,
  ),
  fontFamily: AppFonts.sfUiDisplay,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 16,
      ),
      
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white, // This controls the text color
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide.none,
      ),
      minimumSize: const Size(double.maxFinite, 52),
      textStyle: AppTextStyles.textStyle18.copyWith(
        fontWeight: FontWeightHelper.medium,
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.black,
      textStyle: AppTextStyles.textStyle14.copyWith(
        fontWeight: FontWeightHelper.medium,
      ),
    ),
  ),
  tabBarTheme: TabBarTheme(
    indicatorColor: AppColors.primaryColor,
    labelColor: AppColors.primaryColor,
    unselectedLabelColor: AppColors.black,
    labelStyle: AppTextStyles.textStyle16,
    unselectedLabelStyle: AppTextStyles.textStyle16,
    indicatorSize: TabBarIndicatorSize.label,
    labelPadding: const EdgeInsets.all(8),
  ),
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    filled: true,
    fillColor: AppColors.whiteColor,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 18,
    ),
    hintStyle: AppTextStyles.textStyle16.copyWith(
      color: AppColors.baseGrayColor,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.baseGrayColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.primaryColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.errorColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.errorColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
);
