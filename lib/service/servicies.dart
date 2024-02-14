import 'package:shared_preferences/shared_preferences.dart';

class PreferenceServices {
  static SharedPreferences? pref;

  static Future<void> init() async {
    pref = await SharedPreferences.getInstance();
  }

  static Future<void> setData(
      {required String key, required dynamic value}) async {
    if (value is int) {
      await pref!.setInt(key, value);
    } else if (value is double) {
      await pref!.setDouble(key, value);
    } else if (value is bool) {
      await pref!.setBool(key, value);
    } else if (value is String) {
      await pref!.setString(key, value);
    } else if (value is List<String>) {
      await pref!.setStringList(key, value);
    } else {
      print("THIS DATA FORMAT IS NOT VALID");
    }
  }

  static int getIntData({required String key}) {
    return pref!.getInt(key) ?? 0;
  }

  static double getDoubleData({required String key}) {
    return pref!.getDouble(key) ?? 0.0;
  }

  static bool getBoolData({required String key}) {
    return pref!.getBool(key) ?? false;
  }

  static String getStringData({required String key}) {
    return pref!.getString(key) ?? "";
  }

  static List<String> getStringList({required String key}) {
    return pref!.getStringList(key) ?? [];
  }

  static void clearPref({required String key}) {
    pref!.clear();
  }
}
