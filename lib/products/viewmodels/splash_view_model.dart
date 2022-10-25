import 'package:flutter/material.dart';

import '../../core/helpers/token.dart';

class SplashViewModel extends ChangeNotifier {
  bool _status = false;
  bool get status => _status;

  Future<bool> getToken() async {
    final result = await Token.readToken('login');

    if (result != null) {
      _status = true;
      return status;
    } else {
      return status;
    }
  }
}
