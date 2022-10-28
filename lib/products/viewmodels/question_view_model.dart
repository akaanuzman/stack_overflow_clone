// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:stack_overflow_clone/products/models/question_model.dart';

import '../../core/helpers/api.dart';

class QuestionViewModel extends ChangeNotifier {
  List<QuestionModel> _questions = [];
  List<QuestionModel> get questions => _questions;
  final _api = Api();

  Future<void> get getAllQuestions async {
    String url = "/questions/allQuestions";
    final result = await _api.dioGet(url: url);

    if (result?.statusCode == 200) {
      try {
        var datasBest = <QuestionModel>[];
        Iterable listBest = result?.data["questions"];
        datasBest =
            listBest.map((model) => QuestionModel.fromJson(model)).toList();
        _questions = datasBest;
      } catch (e) {
        print(e);
      }
    } else {
      _questions = [];
    }
    notifyListeners();
  }
}
