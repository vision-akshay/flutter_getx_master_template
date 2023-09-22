import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static final PreferenceUtils _preferenceUtils = PreferenceUtils._internal();

  factory PreferenceUtils() {
    return _preferenceUtils;
  }

  PreferenceUtils._internal();

  Future<bool> setPreference(String key, var value) async {
    SharedPreferences preferences = await _getSharedPreference();
    if (value is String) {
      return preferences.setString(key, value);
    } else if (value is bool) {
      return preferences.setBool(key, value);
    } else if (value is double) {
      return preferences.setDouble(key, value);
    } else if (value is int) {
      return preferences.setInt(key, value);
    }
    return false;
  }

  Future<String?> getStringPreference(String key) async {
    SharedPreferences preferences = await _getSharedPreference();
    return preferences.getString(key);
  }

  Future<bool> getBoolPreference(String key) async {
    SharedPreferences preferences = await _getSharedPreference();
    return preferences.getBool(key) ?? false;
  }

  Future<int> getIntPreference(String key) async {
    SharedPreferences preferences = await _getSharedPreference();
    return preferences.getInt(key) ?? 0;
  }

  Future<double> getDoublePreference(String key) async {
    SharedPreferences preferences = await _getSharedPreference();
    return preferences.getDouble(key) ?? 0;
  }

  Future<SharedPreferences> _getSharedPreference() async {
    return SharedPreferences.getInstance();
  }

  Future removeAllData() async {
    SharedPreferences preferences = await _getSharedPreference();
    await preferences.clear();
  }

  Future resetAllData() async {
    // SharedPreferences preferences = await _getSharedPreference();

    // await preferences.remove(AppStrings.keyToken);
    //   await preferences.remove(AppStrings.keyId);
    //   await preferences.remove(AppStrings.keyFullName);
  }
}
