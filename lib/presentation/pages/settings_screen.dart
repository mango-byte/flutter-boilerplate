import 'package:flutter/material.dart';
import 'package:boilerplate/config/util/string_util.dart';
import 'package:boilerplate/data/constants/locale_key.dart';
import 'package:boilerplate/config/application.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringUtil.getText(context, LocaleKey.settings)!),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    onPressed: () {
                      application.changeLanguageCallback!(const Locale('en'));
                    },
                    child: const Text('English'),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    onPressed: () {
                      application.changeLanguageCallback!(const Locale('ja'));
                    },
                    child: const Text('Japanese'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
