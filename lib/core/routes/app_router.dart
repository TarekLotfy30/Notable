// da ely ha3ml feh el routing beta3 el screens

import 'package:flutter/material.dart';
import '../../features/onboarding/ui/screen/onboarding_view.dart';
import '../../features/splash/ui/screens/splash_view.dart';
import 'app_routes_name.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashView:
        return _buildRoute(const SplashView());
      case AppRoutes.onboardingView:
        return _buildRoute(const OnBoardingView());
      default:
        return _buildRoute(_wrongRoute);
    }
  }

  // Route<dynamic> _buildRoute(Widget screen) {
  //   return PageRouteBuilder(
  //     transitionDuration: const Duration(milliseconds: 500),
  //     reverseTransitionDuration: const Duration(milliseconds: 500),
  //     pageBuilder: (context, animation, _) => screen,
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       final slideTween = Tween(
  //         begin: const Offset(0.0, 1.0),
  //         end: Offset.zero,
  //       ).chain(
  //         CurveTween(curve: Curves.easeInOut),
  //       );
  //       return SlideTransition(
  //         position: animation.drive(slideTween),
  //         child: FadeTransition(
  //           opacity: animation,
  //           child: child,
  //         ),
  //       );
  //     },
  //   );
  // }

  final _wrongRoute = Scaffold(
    appBar: AppBar(
      title: const Text(
        'Wrong Route',
      ),
    ),
  );

  MaterialPageRoute _buildRoute(Widget child) {
    return MaterialPageRoute(builder: (context) => child);
  }
}
