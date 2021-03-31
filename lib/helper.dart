import 'package:flutter/material.dart.';
import 'package:localization_app/language/appLocal.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String LAGUAGE_CODE = 'languageCode';
const String ENGLISH = 'en';
const String ARABIC = 'ar';

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return Locale(ENGLISH,'');
      break;
    case ARABIC:
      return Locale(ARABIC, '');
      break;
    default:
      return Locale(ENGLISH, '');
  }
}

String getTranslated(BuildContext context, String key) {
  return AppLocal.of(context).translate(key);
}

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LAGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? "en";
  return _locale(languageCode);
}
