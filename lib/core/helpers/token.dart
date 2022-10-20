import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class Token {
  static const String sharedSecret = '?0,_:W9Z=nxxM}ph=8';
  static const tokenKey = 'toomeToken';

  static saveToken({required String token, required String key}) async {
    const options = IOSOptions(accessibility: KeychainAccessibility.first_unlock);
    var storage = const FlutterSecureStorage();
    await storage.write(
        key: tokenKey + key,
        value: token,
        aOptions: _getAndroidOptions(),
        iOptions: options);
  }

  static Future<String?> readToken(String k) async {
    var storage = const FlutterSecureStorage();
    var value =
        await storage.read(key: tokenKey + k, aOptions: _getAndroidOptions());

    return value;
  }

  static Future<void> deleteAll() async {
    var storage = const FlutterSecureStorage();
    await storage.deleteAll(aOptions: _getAndroidOptions());
  }

  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
}
