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

part '../components/onboarding_view_body.dart';
part '../components/onboarding_button.dart';
part '../components/onboarding_custom_item.dart';
part '../components/onboarding_page_view.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: _OnboardingViewBody(),
      ),
    );
  }
}
