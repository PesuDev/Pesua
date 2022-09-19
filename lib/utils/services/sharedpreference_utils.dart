import 'dart:convert';

import 'package:pesu/utils/services/sf_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/sp_constants.dart';

class SharedPreferenceUtil {

  getJson(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key).toString());
  }

  Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<bool?>setJson(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, json.encode(value));
  }

  Future<bool> setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  // Future<bool?> getBool(String key) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getBool(key);
  // }


  Future<String?> getToken() async {
    String? registeredToken = await getString(sp_token);
    if (registeredToken != null && registeredToken.length > 0) {
      return registeredToken;
    }
  }

  Future<bool?> setStringWithKeyValue(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  getAllKeys() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getKeys();
  }
  Future<bool?> removeKey(String input) async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(input);
  }

 Future<bool> clearAll() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
   return await preferences.clear();
  }


}