import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/helpers/api.dart';
import '../../core/helpers/token.dart';
import 'api_view_model.dart';

class SplashViewModel extends ChangeNotifier {
  bool _status = false;
  bool get status => _status;

  final _api = Api();

  Future<bool> get getToken async {
    final result = await Token.readToken('login');
    if (result != null) {
      _status = true;
      await getAllApi;
      return status;
    } else {
      return status;
    }
  }

  Future<void> get getAllApi async {
    final pv = Provider.of<ApiViewModel>(_api.currentContext, listen: false);
    await pv.getAllApi;
  }
}
