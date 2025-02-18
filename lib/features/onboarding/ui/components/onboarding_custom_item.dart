
part of '../screen/onboarding_view.dart';
class _OnboardingCustomItem extends StatelessWidget {
  const _OnboardingCustomItem({
    required this.onboarding,
  });

  final Onboarding onboarding;

  Future<void> _handleSkip(BuildContext context) async {
    context.read<OnboardingCubit>().savedToSharedPref();
    context.removeAllAndNavigateToNamedRoute(
      AppRoutes.login,
      predicate: (route) {
        return false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: TextButton(
            onPressed: () async => _handleSkip(context),
            child: const Text('SKIP'),
          ),
        ),
        verticalSpacing(15),
        Image.asset(
          onboarding.image,
          height: 300.h,
          width: double.infinity,
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
        verticalSpacing(40),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
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
