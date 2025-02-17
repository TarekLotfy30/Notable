import 'package:flutter/material.dart';
import 'package:noteable/core/utils/typography/app_font_sizes.dart';

import 'font_weight_helper.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle font24Regular = TextStyle(
    fontSize: AppFontSizes.h1,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font20Regular = TextStyle(
    fontSize: AppFontSizes.h2,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font16Regular = TextStyle(
    fontSize: AppFontSizes.h3,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font14Regular = TextStyle(
    fontSize: AppFontSizes.h4,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font12Regular = TextStyle(
    fontSize: AppFontSizes.h5,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font10Regular = TextStyle(
    fontSize: AppFontSizes.h6,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font8Regular = TextStyle(
    fontSize: AppFontSizes.h7,
    fontWeight: FontWeightHelper.regular,
  );
}
