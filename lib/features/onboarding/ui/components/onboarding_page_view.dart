import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/onboarding_cubit.dart';
import '../../data/model/onboarding_model.dart';
import 'onboarding_custom_item.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) => OnboardingCustomItem(
        onboarding: onboardingList[index],
      ),
      controller: context.read<OnboardingCubit>().boardController,
      itemCount: onboardingList.length,
      physics: const BouncingScrollPhysics(),
      onPageChanged: (value) {
        context.read<OnboardingCubit>().onPageChanged(value);
        if (value == onboardingList.length - 1) {
          context.read<OnboardingCubit>().isLast = true;
        } else {
          context.read<OnboardingCubit>().isLast = false;
        }
      },
    );
  }
}
