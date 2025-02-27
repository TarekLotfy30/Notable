import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/ui/screen/auth_view.dart';
import '../../features/onboarding/cubit/onboarding_cubit.dart';
import '../../features/onboarding/ui/screen/onboarding_view.dart';
import '../../features/splash/ui/screens/splash_view.dart';
import 'app_routes_name.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    debugPrint('⚡ Navigating to: ${settings.name}');
    switch (settings.name) {
      case AppRoutes.splash:
        return _buildRoute(const SplashView());
      case AppRoutes.onboarding:
        return _buildRoute(
          BlocProvider(
            create: (context) => OnboardingCubit(),
            child: const OnboardingView(),
          ),
        );
      case AppRoutes.login:
        return _buildRoute(const AuthView());
      default:
        return _buildRoute(_wrongRoute());
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

  Widget _wrongRoute() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wrong Route'),
      ),
      body: const Center(
        child: Text('404 - Page not found'),
      ),
    );
  }

  MaterialPageRoute<dynamic> _buildRoute(Widget child) {
    return MaterialPageRoute(builder: (context) => child);
  }
}
