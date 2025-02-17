import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/extensions.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/typography/app_text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  // Future<Widget> _getNextScreen() async {
  //  //final bool skipOnBoarding =await LocalData.get(key: AppSharedKeys.skipOnBoarding) ?? false;
  //  //final String? token = await LocalData.get(key: AppSharedKeys.token);
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
    return Scaffold(
      //backgroundColor: ,
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'notable.',
              textStyle: AppTextStyles.font32Bold,
              speed: const Duration(days: 150),
            ),
          ],
          totalRepeatCount: 1,
          displayFullTextOnTap: true,
          onFinished: () async {
            context.navigateToNamedRoute(AppRoutes.onboardingScreen);
            //final nextScreen = await _getNextScreen();
            //Navigation.pushAndRemove(context, nextScreen);
          },
        ),
      ),
    );
  }
}
