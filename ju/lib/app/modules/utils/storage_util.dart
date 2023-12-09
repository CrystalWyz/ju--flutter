import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {

  static set(String key, dynamic value) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  static get(String key) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      String? tempData = prefs.getString(key);
      if (tempData != null) {
        return json.decode(tempData);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static remove(String key) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static clear(String key) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}