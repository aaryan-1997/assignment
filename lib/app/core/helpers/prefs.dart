import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class PrefRepository {
  SharedPreferences? _appPref;
  static const _tokenKey = 'token';

  PrefRepository() {
    _initPref();
  }

  Future<void> _initPref() async {
    _appPref = await SharedPreferences.getInstance();
  }

  Future<void> saveToken(String token) async {
    _appPref ??= await SharedPreferences.getInstance();
    try {
      await _appPref!.setString(_tokenKey, token);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<String?> getToken() async {
    try {
      _appPref ??= await SharedPreferences.getInstance();
      String? token = _appPref?.getString(_tokenKey);
      return token;
    } catch (e) {
      return null;
    }
  }
}
