import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  SpUtil._internal();

  factory SpUtil() => _instance;
  static late final SpUtil _instance = SpUtil._internal();
  static late SharedPreferences _preferences;

  static Future<SpUtil> init() async {
    return getInstance();
  }

  static Future<SpUtil> getInstance() async {
    _preferences = await SharedPreferences.getInstance();
    return _instance;
  }

  static Future<bool> setInt(String key, int value) async {
    return _preferences.setInt(key, value);
  }

  static int? getInt(String key, {int defaultInt = 0}) {
    return _preferences.getInt(key) ?? defaultInt;
  }

  static Future<bool> setBool(String key, bool value) async {
    return _preferences.setBool(key, value);
  }

  static bool? getBool(String key, {bool defaultBool = false}) {
    return _preferences.getBool(key) ?? defaultBool;
  }

  static Future<bool> setString(String key, String value) async {
    return _preferences.setString(key, value);
  }

  static String? getString(String key, {defaultString = ""}) {
    return _preferences.getString(key) ?? defaultString;
  }

  static Future<bool> removeString(String key) async {
    return _preferences.remove(key);
  }
}
