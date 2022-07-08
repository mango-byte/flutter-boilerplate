import 'package:boilerplate/injection.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/config/app_config.dart';
import 'package:boilerplate/main.dart';

void main() {
  // setup();
  const AppConfig _app = AppConfig(
    apiBaseUrl: 'http://35.240.233.186:8090',
    child: MainApp(),
  );
  runApp(_app);
}
