import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalHelper {
  LocalHelper(this.pref) {
    debugPrint('✅SharedPreferences initialized successfully.');
  }

  final SharedPreferences pref;

  // static Future<void> init() async {
  //   _pref = await SharedPreferences.getInstance();
  //   debugPrint('SharedPreferences initialized successfully.');
  // }

  Future<void> set({required String key, required dynamic value}) async {
    debugPrint('Setting value for key: $key, value: $value');

    switch (value.runtimeType) {
      case const (int):
        await pref.setInt(key, value as int);
        debugPrint('Value set as int: $value');

      case const (double):
        await pref.setDouble(key, value as double);
        debugPrint('Value set as double: $value');
      case const (String):
        await pref.setString(key, value as String);
        debugPrint('Value set as String: $value');
      case const (bool):
        await pref.setBool(key, value as bool);
        debugPrint('Value set as bool: $value');
      case const (List<String>):
        await pref.setStringList(key, value as List<String>);
        debugPrint('Value set as List<String>: $value');
      default:
        throw UnsupportedError(
          'Unsupported data type for SharedPreference: ${value.runtimeType}',
        );
    }
  }

  dynamic get({required String key}) async {
    debugPrint('Fetching value for key: $key');

    if (pref.get(key) == null) {
      debugPrint('No value found for key: $key');
      return;
    }

    debugPrint('Value fetched for key: $key, value: ${pref.get(key)}');
    return pref.get(key);
  }

  Future<void> remove({required String key}) async {
    debugPrint('Removing value for key: $key');

    if (!pref.containsKey(key)) {
      debugPrint('Key does not exist: $key');
      return;
    }

    await pref.remove(key);
    debugPrint('Value removed for key: $key');
  }

  Future<void> clearAllData() async {
    debugPrint('Clearing all data from SharedPreferences');

    await pref.clear();
    debugPrint('All data cleared successfully.');
  }

  bool exists({required String key}) {
    debugPrint('Checking if key exists: $key');

    debugPrint('Key exists: ${pref.containsKey(key)}');
    return pref.containsKey(key);
  }
}
