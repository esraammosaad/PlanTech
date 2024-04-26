import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static SharedPreferences get instance {
    assert(_preferences != null);
    return _preferences!;
  }
}