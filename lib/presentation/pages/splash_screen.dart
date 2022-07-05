import 'dart:async';

import 'package:boilerplate/presentation/pages/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/config/util/TransitionUtil.dart';
import 'package:boilerplate/data/constants/Images.dart';
import 'package:boilerplate/presentation/widgets/view/custom_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  void _startTimer() {
    Timer(const Duration(seconds: 2), () async {
      TransitionUtil.replace(context, const RegisterScreen(), true);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: CustomContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64.0),
          child: Center(child: Image.asset(Images.splash)),
        ),
      ),
    );
  }
}
