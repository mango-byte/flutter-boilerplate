import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef ChangeLanguageCallback = void Function(Locale locale);

class Application {
  final MethodChannel methodChannel = const MethodChannel('base_project');
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final List<String> languageCodes = ['en', 'ja'];

  Iterable<Locale> get supportedLocales =>
      languageCodes.map<Locale>((language) => Locale(language));

  ChangeLanguageCallback? changeLanguageCallback;
}

Application application = Application();
