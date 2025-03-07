part of '../screen/onboarding_view.dart';

class _OnboardingViewBody extends StatelessWidget {
  const _OnboardingViewBody();

  Future<void> _handleSkip(BuildContext context) async {
    context.read<OnboardingCubit>().savedToSharedPref();
    context.removeAllAndNavigateToNamedRoute(
      AppRoutes.auth,
      predicate: (route) {
        return false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: TextButton(
              onPressed: () async => _handleSkip(context),
              child: const Text('SKIP'),
            ),
          ),
          verticalSpacing(15),
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
