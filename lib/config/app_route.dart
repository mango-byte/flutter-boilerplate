import 'package:flutter/material.dart';
import 'package:boilerplate/presentation/pages/settings_screen.dart';
import 'package:boilerplate/presentation/pages/splash_screen.dart';

mixin AppRoute {
  static const String SPLASH_SCREEN = '/splash_screen';
  static const String SETTINGS_SCREEN = '/settings_screen';

  static Map<String, WidgetBuilder> routes = {
    SPLASH_SCREEN: (_) => const SplashScreen(),
    SETTINGS_SCREEN: (_) => const SettingsScreen(),
  };
}
