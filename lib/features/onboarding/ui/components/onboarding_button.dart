import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routes/app_routes_name.dart';
import '../../../../core/routes/extensions.dart';
import '../../../../core/widgets/button_custom_widget.dart';
import '../../cubit/onboarding_cubit.dart';
import '../../data/model/onboarding_model.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return AppButton(
          borderRadius: 100,
          buttonWidth: 212,
          sideBorder: BorderSide.none,
          buttonText: context.read<OnboardingCubit>().currentIndex ==
                  onboardingList.length - 1
              ? 'Get Started'
              : 'Next',
          onPressed: () async {
            if (context.read<OnboardingCubit>().isLast) {
              context.removeAllAndNavigateToNamedRoute(
                AppRoutes.loginView,
                predicate: (route) => false,
              );
              // TODO(username): save to shared pref
              //context.read<OnboardingCubit>().savedToSharedPref();
            } else {
              context.read<OnboardingCubit>().boardController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOutCubic,
                  );
            }
          },
        );
      },
    );
  }
}
