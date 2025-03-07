
part of '../screen/onboarding_view.dart';

class _Button extends StatelessWidget {
  const _Button();

  Future<void> _handleButtonPress(BuildContext context) async {
    if (context.read<OnboardingCubit>().isLast) {
      context.removeAllAndNavigateToNamedRoute(
        AppRoutes.auth,
        predicate: (route) => false,
      );
      context.read<OnboardingCubit>().savedToSharedPref();
    } else {
      context.read<OnboardingCubit>().boardController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOutCubic,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async => _handleButtonPress(context),
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            minimumSize: WidgetStateProperty.all(
              const Size(212, 52),
            ),
          ),
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          return Text(
            context.read<OnboardingCubit>().currentIndex ==
                    onboardingList.length - 1
                ? 'Get Started'
                : 'Next',
          );
        },
      ),
    );
  }
}
