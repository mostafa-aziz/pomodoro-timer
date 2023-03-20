import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  Future<SharedPreferences> get _sharedPreferences => SharedPreferences.getInstance();

  Future<dynamic> put(String key, Object value) async {
    if (value is int) {
      return (await _sharedPreferences).setInt(key, value);
    } else if (value is String) {
      return (await _sharedPreferences).setString(key, value);
    } else if (value is bool) {
      return (await _sharedPreferences).setBool(key, value);
    } else if (value is double) {
      return (await _sharedPreferences).setDouble(key, value);
    } else if (value is List<String>) {
      return (await _sharedPreferences).setStringList(key, value);
    }
  }

  Future<String?> getString(String key, {String? defaultValue}) async =>
      (await _sharedPreferences).getString(key) ?? defaultValue;

  Future<bool> getBool(String key, {bool defaultValue = false}) async =>
      (await _sharedPreferences).getBool(key) ?? defaultValue;

  Future<double> getDouble(String key, {double defaultValue = -1}) async =>
      (await _sharedPreferences).getDouble(key) ?? defaultValue;

  Future<int> getInt(String key, {int defaultValue = -1}) async => (await _sharedPreferences).getInt(key) ?? defaultValue;
}
