import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocal {
  Locale locale;

  AppLocal(this.locale);

  static AppLocal of(BuildContext context) {
    return Localizations.of(context, AppLocal);
  }

  Map<String, String> _localizedValues;
  Future<void> load() async {
    String jsonStringValues =
    await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    _localizedValues =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String translate(String key) {
    return _localizedValues[key];
  }


  // static member to have simple access to the delegate from Material App
  static const LocalizationsDelegate<AppLocal> delegate =
  _DemoLocalizationsDelegate();
}



class _DemoLocalizationsDelegate extends LocalizationsDelegate<AppLocal> {
  const _DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en','ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocal> load(Locale locale) async {
    AppLocal localization = new AppLocal(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocal> old) => false;
}


