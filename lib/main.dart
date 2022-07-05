import 'package:boilerplate/data/dio/dio_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:boilerplate/config/app_config.dart';
import 'package:boilerplate/config/app_route.dart';
import 'package:boilerplate/config/localization/translator_delegate.dart';
import 'package:boilerplate/config/util/shared_pref_util.dart';
import 'package:boilerplate/config/application.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TranslatorDelegate _translatorDelegate = const TranslatorDelegate(null);

  @override
  void initState() {
    _setupSystem();
    _translateLanguage();
    application.changeLanguageCallback = _changeLanguageCallback;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    DioEndpoint(AppConfig.of(context)!.apiBaseUrl!);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.red,
          fontFamily: 'OpenSans, Regular'
      ),
      localizationsDelegates: [
        _translatorDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: application.supportedLocales,
      navigatorKey: application.navigatorKey,
      routes: AppRoute.routes,
      initialRoute: AppRoute.splashScreen,
    );
  }

  Future<void> _setupSystem() async {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
    ));
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  void _changeLanguageCallback(Locale locale) {
    SharedPrefUtil.setValue(
      PrefType.STRING,
      PrefKey.LANGUAGE_CODE,
      locale.languageCode,
    );
    setState(() {
      _translatorDelegate = TranslatorDelegate(locale);
    });
  }

  Future<void> _translateLanguage() async {
    final code = await SharedPrefUtil.getString(PrefKey.LANGUAGE_CODE);
    setState(() {
      _translatorDelegate = const TranslatorDelegate(Locale('ja'));
    });
  }
}
