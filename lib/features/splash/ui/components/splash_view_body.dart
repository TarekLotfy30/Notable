part of '../screens/splash_view.dart';

class _SplashViewBody extends StatelessWidget {
  const _SplashViewBody();

  // Future<Widget> _getNextScreen() async {
  // final bool skipOnBoarding =await LocalData.get(key: AppSharedKeys.skipOnBoarding) ?? false;
  // final String? token = await LocalData.get(key: AppSharedKeys.token);
  //   if (skipOnBoarding) {
  //     if (token == null) {
  //       return const LoginScreen();
  //     } else {
  //       return const SharedHome();
  //     }
  //   } else {
  //     return BlocProvider(
  //       create: (context) => OnboardingCubit(),
  //       child: const OnBoardingScreen(),
  //     );
  //   }
  // }

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
            speed: const Duration(milliseconds: 100),
          ),
        ],
        totalRepeatCount: 1,
        displayFullTextOnTap: true,
        onFinished: () async {
          context.navigateToNamedRoute(AppRoutes.splashView);
          // TODO(home_user): do this please
          //final nextScreen = await _getNextScreen();
          //Navigation.pushAndRemove(context, nextScreen);
        },
      ),
    );
  }
}
