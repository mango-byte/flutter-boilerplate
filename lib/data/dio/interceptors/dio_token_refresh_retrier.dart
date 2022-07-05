
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioTokenRefreshRetrier {
  DioTokenRefreshRetrier({
    @required required this.dio
  });
  Dio dio;

  void scheduleTokenRefreshRetry(RequestOptions requestOptions) async {
  }
}