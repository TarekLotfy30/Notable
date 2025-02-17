import 'package:flutter/material.dart';

import 'core/routes/app_router.dart';
import 'noteable_app.dart';

void main() {
  runApp(
    NoteableApp(
      appRouter: AppRouter(),
    ),
  );
}
