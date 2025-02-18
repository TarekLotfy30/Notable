import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routes/app_router.dart';
import 'core/routes/app_routes_name.dart';
import 'core/utils/themes/dark_theme.dart';
import 'core/utils/themes/light_theme.dart';

class NoteableApp extends StatelessWidget {
  const NoteableApp({super.key});

  // It's good practice to create a single instance of AppRouter
  static final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 780),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        onGenerateRoute: _appRouter.generateRoute,
        initialRoute: AppRoutes.splash,
      ),
    );
  }
}
