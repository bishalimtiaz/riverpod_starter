import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferenceManager {
  static final _preference = SharedPreferences.getInstance();

  static const keyToken = "token";

  static Future<String> getString(String key, {String defaultValue = ""}){
    return _preference
        .then((preference) => preference.getString(key) ?? defaultValue);
  }

  static Future<bool> setString(String key, String value){
    return _preference.then((preference) => preference.setString(key, value));
  }

  static Future<int> getInt(String key, {int defaultValue = 0}){
    return _preference
        .then((preference) => preference.getInt(key) ?? defaultValue);
  }

  static Future<bool> setInt(String key, int value){
    return _preference.then((preference) => preference.setInt(key, value));
  }

  static Future<double> getDouble(String key, {double defaultValue = 0.0}){
    return _preference
        .then((preference) => preference.getDouble(key) ?? defaultValue);
  }

  static Future<bool> setDouble(String key, double value){
    return _preference.then((preference) => preference.setDouble(key, value));
  }

  static Future<bool> getBool(String key, {bool defaultValue = false}){
    return _preference
        .then((preference) => preference.getBool(key) ?? defaultValue);
  }

  static Future<bool> setBool(String key, bool value){
    return _preference.then((preference) => preference.setBool(key, value));
  }

  static Future<List<String>> getStringList(String key,
      {List<String> defaultValue = const []}){
    return _preference
        .then((preference) => preference.getStringList(key) ?? defaultValue);
  }

  static Future<bool> setStringList(String key, List<String> value){
    return _preference
        .then((preference) => preference.setStringList(key, value));
  }

  static Future<bool> remove(String key){
    return _preference.then((preference) => preference.remove(key));
  }

  static Future<bool> clear(){
    return _preference.then((preference) => preference.clear());
  }
}
