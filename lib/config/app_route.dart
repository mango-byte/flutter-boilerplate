import 'package:boilerplate/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/presentation/pages/settings_screen.dart';
import 'package:boilerplate/presentation/pages/splash_screen.dart';

mixin AppRoute {
  static const String splashScreen = '/splash_screen';
  static const String settingScreen = '/settings_screen';
  static const String homeScreen = '/home_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (_) => const SplashScreen(),
    settingScreen: (_) => const SettingsScreen(),
    homeScreen: (_) => const HomeScreen(),
  };
}
