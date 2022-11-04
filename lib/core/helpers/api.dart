// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stack_overflow_clone/core/base/base_singleton.dart';
import 'package:stack_overflow_clone/core/helpers/token.dart';

import '../utils/navigation_service.dart';

class Api extends BaseSingleton {
  String baseUrl = "http://localhost:3030/api";
  var dio = Dio();
  String? token;
  BuildContext currentContext = NavigationService.navigatorKey.currentContext!;
  setHeaderWithOutToken() {
    Map<String, String> q = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    return q;
  }

  setHeaderWithToken() async {
    final tkn = await Token.readToken('login');
    if (tkn != null) {
      token = tkn;
    }
    Map<String, String> q = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer ${token ?? ''}',
    };
    return q;
  }

  Future<Response?> dioPost(
      {required String url,
      String? fullUrl,
      bool useToken = true,
      Map<String, dynamic>? obj,
      bool post = true}) async {
    Map<String, String> headers;
    print("dio post: $baseUrl$url");
    if (useToken) {
      headers = await setHeaderWithToken();
    } else {
      headers = setHeaderWithOutToken();
    }
    print(obj);
    try {
      Response response;
      if (post) {
        response = await dio.post(fullUrl ?? baseUrl + url,
            data: obj,
            options: Options(
              headers: headers,
            ));
        print(response);
      } else {
        response = await dio.put(baseUrl + url,
            data: obj,
            options: Options(
              headers: headers,
            ));
      }
      print(response.data);
      return response;
    } on DioError catch (e) {
      print(e.message);
      print(e.response?.statusCode);
      return e.response;
    }
  }

  Future<Response?> dioGet({
    required String url,
    bool useToken = true,
    bool get = true,
    Map<String, dynamic>? obj,
  }) async {
    print("dio get: $url");
    Map<String, String> headers;
    if (useToken) {
      headers = await setHeaderWithToken();
    } else {
      headers = setHeaderWithOutToken();
    }
    try {
      Response response;
      if (get) {
        response =
            await dio.get(baseUrl + url, options: Options(headers: headers));
      } else {
        response = await dio.delete(baseUrl + url,
            options: Options(headers: headers), data: obj);
      }
      return response;
    } on DioError catch (e) {
      print(e.message);
      print(e.response?.statusCode);
      print('dioGet error : ${e.response?.data}');
      return e.response;
    }
  }

  Future<Response?> dioPostMultiPart({
    required String url,
    required FormData obj,
    bool useToken = true,
  }) async {
    Map<String, String> headers;
    if (useToken) {
      headers = await setHeaderWithToken();
    } else {
      headers = setHeaderWithOutToken();
    }
    try {
      Response response = await Dio()
          .post(baseUrl + url, data: obj, options: Options(headers: headers));
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }
}
