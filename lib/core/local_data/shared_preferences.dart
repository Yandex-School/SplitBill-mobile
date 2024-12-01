import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  final SharedPreferences _sharedPreferences;

  SharedPrefsService(SharedPreferences preferences) : _sharedPreferences = preferences;

  Future<void> saveString(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }

  Future<String?> getString(String key) async {
    return _sharedPreferences.getString(key);
  }

  Future<void> saveBool(String key, bool value) async {
    await _sharedPreferences.setBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    return _sharedPreferences.getBool(key);
  }
}
