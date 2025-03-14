import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/auth/data/repo/login_repo_impl.dart';
import '../services/local/local_helper.dart';
import '../services/network/dio_helper.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  try {
    // Dio and DioHelper
    log('Setting up Dio instance');
    final dio = Dio();
    getIt.registerSingleton<Dio>(dio);
    log('Dio instance registered');
    log('Setting up DioHelper');
    final dioHelper = DioHelper(getIt<Dio>());
    getIt.registerSingleton<DioHelper>(dioHelper);
    log('DioHelper registered');

    // SharedPreferences
    log('Initializing SharedPreferences');
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerSingleton<SharedPreferences>(sharedPreferences);
    log('SharedPreferences registered');

    // LocalHelper
    log('Creating LocalHelper');
    final localHelper = LocalHelper(sharedPreferences);
    getIt.registerSingleton<LocalHelper>(localHelper);
    log('LocalHelper registered');

    getIt.registerSingleton<LoginRepoImpl>(
      LoginRepoImpl(
        dio: getIt<DioHelper>(),
        local: getIt<LocalHelper>(),
      ),
    );

    log('Service Locator setup complete');
  } catch (e, stackTrace) {
    log(
      'Error in Service Locator setup',
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
