import 'package:flutter/material.dart';
import 'package:boilerplate/config/app_config.dart';
import 'package:boilerplate/main.dart';

void main() {
  const AppConfig _app = AppConfig(
    apiBaseUrl: '',
    child: MainApp(),
  );
  runApp(_app);
}
