import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/helpers/functions.dart';
import '../../../../core/routes/app_routes_name.dart';
import '../../../../core/routes/extensions.dart';
import '../../../../core/utils/colors/app_colors.dart';
import '../../../../core/utils/typography/app_text_styles.dart';
import '../../../../core/utils/typography/font_weight_helper.dart';
import '../../cubit/onboarding_cubit.dart';
import '../../data/model/onboarding_model.dart';

class OnboardingCustomItem extends StatelessWidget {
  const OnboardingCustomItem({
    super.key,
    required this.onboarding,
  });

  final Onboarding onboarding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: TextButton(
            onPressed: () async {
              // TODO(username): save to shared pref
              //OnboardingCubit.get(context).savedToSharedPref();
              context.removeAllAndNavigateToNamedRoute(
                AppRoutes.loginView,
                predicate: (route) {
                  return false;
                },
              );
            },
            child: Text(
              'SKIP',
              style: AppTextStyles.textStyle14.copyWith(
                fontWeight: FontWeightHelper.medium,
              ),
            ),
          ),
        ),
        verticalSpacing(15),
        Image.asset(
          onboarding.image,
          width: double.infinity,
          height: 343.h,
          fit: BoxFit.cover,
        ),
        verticalSpacing(40),
        SmoothPageIndicator(
          controller: context.read<OnboardingCubit>().boardController,
          count: onboardingList.length,
          effect: WormEffect(
            dotColor: AppColors.baseGrayColor,
            activeDotColor: AppColors.primaryColor,
            dotHeight: 10.h,
            dotWidth: 10.w,
            spacing: 8.w,
          ),
        ),
        verticalSpacing(35),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            onboarding.title,
            textAlign: TextAlign.center,
            style: AppTextStyles.textStyle20.copyWith(
              fontWeight: FontWeightHelper.bold,
            ),
          ),
        ),
        verticalSpacing(15),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Text(
            onboarding.description,
            textAlign: TextAlign.center,
            style: AppTextStyles.textStyle14.copyWith(
              fontWeight: FontWeightHelper.light,
            ),
          ),
        ),
      ],
    );
  }
}
