import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _preferences;
  static const _userToken = 'USER_TOKEN';
  static const _language = 'LANGUAGE';
  static init() async {
    _preferences = await SharedPreferences.getInstance();
  }
  static setUserToken(String token) async {
    await _preferences.setString(_userToken, token);
  }
  static String getUserToken() {
    return _preferences.getString(_userToken) ?? "";
  }

  static setLang(lang) async {
    await _preferences.setString(_language, lang);
  }

  static String getLang() {
    return _preferences.getString(_language) ?? "ar";
  }
  static remove() async {
    await _preferences.clear();
  }
  static removeUserToken() async {
    await _preferences.remove(_userToken);
  }



}