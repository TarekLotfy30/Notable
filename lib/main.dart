import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/service_locator.dart';
import 'core/services/local/local_helper.dart' show LocalHelper;
import 'core/services/network/dio_helper.dart';
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

  // Get instances of DioHelper and LocalHelper
  final dioHelper1 = getIt<DioHelper>();
  final dioHelper2 = getIt<DioHelper>();

  final localHelper1 = getIt<LocalHelper>();
  final localHelper2 = getIt<LocalHelper>();

  // Print the hash codes of the instances
  debugPrint('DioHelper Instance 1: ${dioHelper1.hashCode}');
  debugPrint('DioHelper Instance 2: ${dioHelper2.hashCode}');
  debugPrint(
    'Are DioHelper instances the same? ${identical(
      dioHelper1,
      dioHelper2,
    )}',
  );

  debugPrint('LocalHelper Instance 1: ${localHelper1.hashCode}');
  debugPrint('LocalHelper Instance 2: ${localHelper2.hashCode}');
  debugPrint(
    'Are LocalHelper instances the same? ${identical(
      localHelper1,
      localHelper2,
    )}',
  );
  localHelper2.clearAllData();
  Bloc.observer = MyBlocObserver();
  runApp(const NoteableApp());
}
