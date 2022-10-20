// ignore_for_file: avoid_print

import 'dart:io';
import 'package:stack_overflow_clone/core/helpers/token.dart';
import 'package:dio/dio.dart';

class Api {
  String baseUrl = "";
  var dio = Dio();
  String? token;
  setHeaderWithOutToken() {
    Map<String, String> q = {
      HttpHeaders.contentTypeHeader: 'application/json',
      'mobileHeader': 'nAvn4gsYD=;2:.4"'
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
      'mobileHeader': 'nAvn4gsYD=;2:.4"'
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
    print("dio post: $url");
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
