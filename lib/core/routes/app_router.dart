// da ely ha3ml feh el routing beta3 el screens

import 'package:flutter/material.dart';
import '../../features/splash_screen/ui/screens/splash_screen.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return _buildRoute(SplashScreen());
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
