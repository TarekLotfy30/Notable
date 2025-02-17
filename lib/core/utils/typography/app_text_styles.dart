import 'package:flutter/material.dart';

import 'app_fonts.dart';
import 'font_weight_helper.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle font32Bold = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeightHelper.bold,
    fontFamily: AppFonts.poppins,
  );

  static TextStyle font24Regular = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font20Regular = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font16Regular = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font14Regular = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font12Regular = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font10Regular = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font8Regular = const TextStyle(
    fontSize: 8,
    fontWeight: FontWeightHelper.regular,
  );
}
