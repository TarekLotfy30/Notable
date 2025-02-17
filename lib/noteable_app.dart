import 'package:flutter/material.dart';
import 'package:noteable/core/utils/themes/dark_theme.dart';

import 'core/routes/app_router.dart';
import 'core/routes/app_routes_name.dart';
import 'core/utils/themes/light_theme.dart';

class NoteableApp extends StatelessWidget {
  const NoteableApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: AppRoutes.splashView,
    );
  }
}
