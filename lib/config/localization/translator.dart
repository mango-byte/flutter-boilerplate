import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Translator {
  Translator._internal();

  static final Translator _instance = Translator._internal();

  static Map<String, dynamic>? _values;

  static Translator? of(BuildContext context) {
    return Localizations.of(context, Translator);
  }

  static Future<Translator> load(Locale locale) async {
    final jsonContent = await rootBundle
        .loadString('assets/locales/localization_${locale.languageCode}.json');
    _values = json.decode(jsonContent) as Map<String, dynamic>;
    return _instance;
  }

  String getString(String key) => _values?[key].toString() ?? '$key not found';
}
