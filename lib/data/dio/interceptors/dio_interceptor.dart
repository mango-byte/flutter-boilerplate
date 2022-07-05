
import 'dart:io';

import 'package:boilerplate/data/dio/interceptors/dio_connectivity_request_retrier.dart';
import 'package:boilerplate/data/dio/interceptors/dio_token_refresh_retrier.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioInterceptor extends Interceptor {
  DioInterceptor({
    @required required this.connectivityRequestRetrier,
    // @required required this.tokenRefreshRetrier
  });
  final DioConnectivityRequestRetrier connectivityRequestRetrier;
  // final DioTokenRefreshRetrier tokenRefreshRetrier;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // TODO: implement onRequest
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if(_shouldRetry(err)) {
      connectivityRequestRetrier.scheduleRequestRetry(err.requestOptions);
    }
    if(_shouldRefreshToken(err)) {
      // tokenRefreshRetrier.scheduleTokenRefreshRetry(err.requestOptions);
    }
  }

  bool _shouldRefreshToken(DioError error) => error.response?.statusCode == 401;

  bool _shouldRetry(DioError err) =>
      err.type == DioErrorType.other && err.error != null &&
      err.error is SocketException;
}