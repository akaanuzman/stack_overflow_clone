import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/helpers/api.dart';
import '../../core/helpers/token.dart';
import 'question_view_model.dart';

class SplashViewModel extends ChangeNotifier {
  bool _status = false;
  bool get status => _status;

  Future<bool> getToken() async {
    final result = await Token.readToken('login');

    if (result != null) {
      _status = true;
      await getAllApi();
      return status;
    } else {
      return status;
    }
  }

  final _api = Api();

  Future<void> getAllApi() async {
    final qvm =
        Provider.of<QuestionViewModel>(_api.currentContext, listen: false);
    await qvm.getAllQuestions;
  }
}
