part of '../screens/splash_view.dart';

class _SplashViewBody extends StatelessWidget {
  const _SplashViewBody();

  Future<String> _getNextScreen() async {
    final skipOnBoarding = await SharedHelper.get(
          key: AppSharedKeys.skipOnBoarding.toString(),
        ) ??
        false;
    //final String? token = await LocalData.get(key: AppSharedKeys.token);
    if (skipOnBoarding) {
      return AppRoutes.login;
      // if (token == null) {
      //   return const LoginScreen();
      // } else {
      //   return const SharedHome();
      // }
    } else {
      return AppRoutes.onboarding;
    }
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
          final nextScreen = await _getNextScreen();
          context.removeAllAndNavigateToNamedRoute(
            nextScreen,
            predicate: (route) => false,
          );
        },
      ),
    );
  }
}
