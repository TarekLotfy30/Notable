
part of '../screen/onboarding_view.dart';

class _OnboardingPageView extends StatelessWidget {
  const _OnboardingPageView();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) => _OnboardingCustomItem(
        onboarding: onboardingList[index],
      ),
      controller: context.read<OnboardingCubit>().boardController,
      itemCount: onboardingList.length,
      physics: const BouncingScrollPhysics(),
      onPageChanged: (index) {
        context.read<OnboardingCubit>().onPageChanged(index);
      },
    );
  }
}
