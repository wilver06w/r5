library mobile_client_preferences;

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _singleton = Preferences._();

  factory Preferences() => _singleton;

  Preferences._();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  final String _languageKey = 'country';
  String get language => _prefs?.getString(_languageKey) ?? 'ES';
  set language(String value) => _prefs?.setString(_languageKey, value);

  final String _isLogged = 'is_logged';
  bool get isLogged => _prefs?.getBool(_isLogged) ?? false;
  set isLogged(bool value) => _prefs?.setBool(_isLogged, value);

  final String _uid = 'uid';
  String get uid => _prefs?.getString(_uid) ?? '';
  set uid(String value) => _prefs?.setString(_uid, value);

  
  final String _token = 'token';
  String get token => _prefs?.getString(_token) ?? '';
  set token(String value) => _prefs?.setString(_token, value);

  final String _refreshToken = 'refresh_token';
  String get refreshToken => _prefs?.getString(_refreshToken) ?? '';
  set refreshToken(String value) => _prefs?.setString(_refreshToken, value);

  Future<void> reload() async {
    await _prefs?.reload();
  }
}
