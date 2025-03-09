import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/functions.dart';
import '../../../../core/utils/images/app_images.dart';
import '../../../../core/utils/typography/app_text_styles.dart';
import '../../../../core/utils/typography/font_weight_helper.dart';

class BuildHeaderForAuth extends StatelessWidget {
  const BuildHeaderForAuth({super.key, 
    required this.title,
    required this.image,
  });

  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.login,
          fit: BoxFit.contain,
          height: 250.h,
        ),
        verticalSpacing(20),
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.textStyle32.copyWith(
            fontWeight: FontWeightHelper.extraBold,
          ),
        ),
      ],
    );
  }
}
