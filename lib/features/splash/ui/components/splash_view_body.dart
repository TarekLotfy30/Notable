// splash_view_body.dart
part of '../screens/splash_view.dart';

class _SplashViewBody extends StatelessWidget {
  const _SplashViewBody();

  // Logic to decide the next screen has been moved to a dedicated method
  // for separation of concerns
  Future<String> _determineNextScreen() async {
    final localHelper = getIt<LocalHelper>();

    final skipOnBoarding = await localHelper.get(
          key: AppSharedKeys.skipOnBoarding.toString(),
        ) ??
        false;

    final token = await localHelper.get(
      key: AppSharedKeys.token.toString(),
    );

    // Use ternary operator for better readability
    if (skipOnBoarding) {
      return token == null ? AppRoutes.auth : AppRoutes.sharedHome;
    }
    return AppRoutes.onboarding;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            'notable.',
            textStyle: AppTextStyles.textStyle32.copyWith(
              color: Colors.white,
            ),
            speed: const Duration(milliseconds: 150),
          ),
        ],
        totalRepeatCount: 1,
        displayFullTextOnTap: true,
        onFinished: () async {
          // Navigate to the next screen after animation finishes
          final nextScreen = await _determineNextScreen();
          _navigateToNextScreen(context, nextScreen);
        },
      ),
    );
  }

  // Dedicated method for navigation to improve clarity and avoid duplication
  Future<void> _navigateToNextScreen(BuildContext context, String route) async {
    context.removeAllAndNavigateToNamedRoute(
      route,
      predicate: (route) => false,
    );
  }
}
