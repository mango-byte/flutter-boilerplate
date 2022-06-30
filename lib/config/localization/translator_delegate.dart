import 'package:flutter/material.dart';
import 'package:boilerplate/config/localization/translator.dart';
import 'package:boilerplate/config/application.dart';

class TranslatorDelegate extends LocalizationsDelegate<Translator> {
  const TranslatorDelegate(this.newLocale);

  final Locale? newLocale;

  @override
  bool isSupported(Locale locale) =>
      application.languageCodes.contains(locale.languageCode);

  @override
  Future<Translator> load(Locale locale) =>
      Translator.load(newLocale ?? locale);

  @override
  bool shouldReload(LocalizationsDelegate<Translator> old) => true;
}
