import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'question_view_model.dart';

import '../../core/helpers/api.dart';
import 'user_view_model.dart';

class ApiViewModel extends ChangeNotifier {
  final _api = Api();

  Future<void> get getAllApi async {
    final BuildContext context = _api.currentContext;
    final qpv = context.read<QuestionViewModel>();
    final upv = context.read<UserViewModel>();
    await Future.wait(
      [
        qpv.getAllQuestions,
        upv.getMyDetails,
      ],
    );
  }
}
