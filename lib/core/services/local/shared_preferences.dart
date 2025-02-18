import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  const SharedHelper._();

  static late SharedPreferences _pref;

  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
    debugPrint('SharedPreferences initialized successfully.');
  }

  static Future<void> set({required String key, required dynamic value}) async {
    debugPrint('Setting value for key: $key, value: $value');

    switch (value.runtimeType) {
      case const (int):
        await _pref.setInt(key, value as int);
        debugPrint('Value set as int: $value');

      case const (double):
        await _pref.setDouble(key, value as double);
        debugPrint('Value set as double: $value');
      case const (String):
        await _pref.setString(key, value as String);
        debugPrint('Value set as String: $value');
      case const (bool):
        await _pref.setBool(key, value as bool);
        debugPrint('Value set as bool: $value');
      case const (List<String>):
        await _pref.setStringList(key, value as List<String>);
        debugPrint('Value set as List<String>: $value');
      default:
        throw UnsupportedError(
          'Unsupported data type for SharedPreference: ${value.runtimeType}',
        );
    }
  }

  static dynamic get({required String key}) async {
    debugPrint('Fetching value for key: $key');

    if (_pref.get(key) == null) {
      debugPrint('No value found for key: $key');
      return;
    }

    debugPrint('Value fetched for key: $key, value: ${_pref.get(key)}');
    return _pref.get(key);
  }

  static Future<void> remove({required String key}) async {
    debugPrint('Removing value for key: $key');

    if (!_pref.containsKey(key)) {
      debugPrint('Key does not exist: $key');
      return;
    }

    await _pref.remove(key);
    debugPrint('Value removed for key: $key');
  }

  static Future<void> clearAllData() async {
    debugPrint('Clearing all data from SharedPreferences');

    await _pref.clear();
    debugPrint('All data cleared successfully.');
  }

  static bool exists({required String key}) {
    debugPrint('Checking if key exists: $key');

    debugPrint('Key exists: ${_pref.containsKey(key)}');
    return _pref.containsKey(key);
  }
}
