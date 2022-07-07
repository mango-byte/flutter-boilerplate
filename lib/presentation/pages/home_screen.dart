
import 'package:boilerplate/config/util/TransitionUtil.dart';
import 'package:boilerplate/data/dio/interceptors/dio_connectivity_request_retrier.dart';
import 'package:boilerplate/data/dio/interceptors/dio_interceptor.dart';
import 'package:boilerplate/presentation/pages/profile_screen.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
    ),
    );
  }

}// End of class
