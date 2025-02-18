part of '../screen/onboarding_view.dart';

class _OnboardingViewBody extends StatelessWidget {
  const _OnboardingViewBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        children: [
          const Expanded(
            child: _OnboardingPageView(),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: const _Button(),
          ),
        ],
      ),
    );
  }
}
