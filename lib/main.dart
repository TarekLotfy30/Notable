import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/service_locator.dart';

import 'core/services/local/local_helper.dart';
import 'noteable_app.dart';
import 'observer.dart';
  
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  // Initialize the service locator
  await setupServiceLocator();
  getIt<LocalHelper>().clearAllData();
  Bloc.observer = MyBlocObserver();
  runApp(const NoteableApp());
}
