import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/config/util/shared_pref_util.dart';

enum Method { post, get, put, delete }

class RestService {
  Future<Response> request({
    @required required String url,
    @required required Method method,
    Map<String, dynamic>? param}) async {

    final token = await SharedPrefUtil.getString(PrefKey.TOKEN);
    final dio = Dio();

    Response response;
    try {
      switch (method) {
        case Method.get:    response = await dio.get(url, queryParameters: param);break;
        case Method.post:   response = await dio.post(url, data: param); break;
        case Method.put:    response = await dio.put(url, data: param); break;
        case Method.delete: response = await dio.delete(url, data: param); break;
      }
      switch (response.statusCode) {
        case 200: return response;
        case 401: throw Exception('Unauthorized');
        case 500:
        case 501:
        case 502:
        case 503: throw Exception('Server Error');
        default: throw Exception("Something does wen't wrong");
      }
    } on SocketException catch (e) { throw Exception('Not Internet Connection');
    } on FormatException catch (e) { throw Exception('Bad response format');
    } on DioError catch (e) { throw Exception(e);
    } catch (e) { throw Exception("Something went wrong");}
  }
}