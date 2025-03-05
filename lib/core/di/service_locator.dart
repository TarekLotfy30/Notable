import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/auth/data/repo/logni_repo_impl.dart';
import '../services/local/local_helper.dart';
import '../services/network/dio_helper.dart';

// registerSingleton: This method registers a type as a singleton, meaning that
// the instance is created immediately when the application starts. Every time
// you request this type, you’ll get the same instance throughout the app’s
// lifecycle.

// registerLazySingleton: Similar to registerSingleton, this method registers a
// type as a singleton as well. However, the instance is not created
// immediately. Instead, it is created the first time it is requested. This
// lazy initialization is generally used to save resources and memory, as it
// delays the creation of the instance until it is actually needed.

// hanshe2 noskha menha
final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  try {
    // Dio and DioHelper
    log('Setting up Dio instance', name: 'ServiceLocator');
    final dio = Dio();
    getIt.registerSingleton<Dio>(dio);
    log('Dio instance registered', name: 'ServiceLocator');
    log('Setting up DioHelper', name: 'ServiceLocator');
    final dioHelper = DioHelper(getIt<Dio>());
    getIt.registerSingleton<DioHelper>(dioHelper);
    log('DioHelper registered', name: 'ServiceLocator');

    // SharedPreferences
    log('Initializing SharedPreferences', name: 'ServiceLocator');
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerSingleton<SharedPreferences>(sharedPreferences);
    log('SharedPreferences registered', name: 'ServiceLocator');

    // LocalHelper
    log('Creating LocalHelper', name: 'ServiceLocator');
    final localHelper = LocalHelper(sharedPreferences);
    getIt.registerSingleton<LocalHelper>(localHelper);
    log('LocalHelper registered', name: 'ServiceLocator');

    getIt.registerSingleton<LoginRepoImpl>(
      LoginRepoImpl(
        dio: getIt<DioHelper>(),
        local: getIt<LocalHelper>(),
      ),
    );

    log('Service Locator setup complete', name: 'ServiceLocator');
  } catch (e, stackTrace) {
    log(
      'Error in Service Locator setup',
      name: 'ServiceLocator',
      error: e,
      stackTrace: stackTrace,
    );
    rethrow;
  }
}

/* Uncomment in main () {
  Initialize the service locator
  await setupServiceLocator();
}*/

// void main() async {

//   await setupServiceLocator();

//   // Get instances of DioHelper and LocalHelper
//   final dioHelper1 = getIt<DioHelper>();
//   final dioHelper2 = getIt<DioHelper>();

//   final localHelper1 = getIt<LocalHelper>();
//   final localHelper2 = getIt<LocalHelper>();

//   // Print the hash codes of the instances
//   print('DioHelper Instance 1: ${dioHelper1.hashCode}');
//   print('DioHelper Instance 2: ${dioHelper2.hashCode}');
//   print('Are DioHelper instances the same? ${identical(dioHelper1,
// dioHelper2)}');

//   print('LocalHelper Instance 1: ${localHelper1.hashCode}');
//   print('LocalHelper Instance 2: ${localHelper2.hashCode}');
//   print('Are LocalHelper instances the same? ${identical(localHelper1, 
// localHelper2)}');
// }
