import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<void> save({required String key, required dynamic value}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(value));
  }

  Future<dynamic> read({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    final dataKey = prefs.getString(key);
    if (dataKey != null) {
      return jsonDecode(dataKey);
    }
    return null;
  }

  Future<bool> remove({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  Future<bool> contains({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }
}
