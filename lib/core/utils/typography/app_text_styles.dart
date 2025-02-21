import 'package:flutter/material.dart';

import 'app_fonts.dart';
import 'font_weight_helper.dart';

class AppTextStyles {
  AppTextStyles._();

    static TextStyle textStyle40 = const TextStyle(
    fontSize: 40,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle textStyle32 = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeightHelper.bold,
    fontFamily: AppFonts.poppins,
  );

  static TextStyle textStyle24 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle textStyle20 = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle textStyle16 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle textStyle14 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle textStyle12 = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle textStyle10 = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle textStyle8 = const TextStyle(
    fontSize: 8,
    fontWeight: FontWeightHelper.regular,
  );
}
