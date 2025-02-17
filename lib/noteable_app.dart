import 'package:flutter/material.dart';
import 'package:noteable/core/utils/themes/dark_theme.dart';

import 'core/utils/themes/light_theme.dart';

class NoteableApp extends StatelessWidget {
  const NoteableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: Placeholder(),
    );
  }
}
