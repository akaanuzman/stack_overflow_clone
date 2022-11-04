import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'question_view_model.dart';

import '../../core/helpers/api.dart';
import 'user_view_model.dart';

class ApiViewModel extends ChangeNotifier {
  final _api = Api();

  Future<void> get getAllApi async {
    final BuildContext context = _api.currentContext;
    final qpv = Provider.of<QuestionViewModel>(context, listen: false);
    final upv = Provider.of<UserViewModel>(context, listen:false);
    await Future.wait(
      [
        qpv.getAllQuestions,
        upv.getMyDetails,
      ],
    );
  }
}
