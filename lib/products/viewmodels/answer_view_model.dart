// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stack_overflow_clone/core/base/base_singleton.dart';
import 'package:stack_overflow_clone/core/helpers/api.dart';
import 'package:stack_overflow_clone/products/models/answer_model.dart';

class AnswerViewModel extends ChangeNotifier with BaseSingleton {
  List<AnswerModel> _answers = [];
  List<AnswerModel> get answers => _answers;
  final _api = Api();

  Future<void> getAllAnswers({required String qId}) async {
    String url = "/questions/$qId/answers/";
    final result = await _api.dioGet(url: url);

    if (result?.statusCode == HttpStatus.ok) {
      try {
        var datasBest = <AnswerModel>[];
        Iterable listBest = result?.data["answers"];
        datasBest =
            listBest.map((model) => AnswerModel.fromJson(model)).toList();
        _answers = datasBest;
      } catch (e) {
        print(e);
      }
    } else {
      _answers = [];
    }
    notifyListeners();
  }

  Future<void> addAnswer({
    required String qId,
    required String content,
  }) async {
    String url = "/questions/$qId/answers/";
    final result = await _api.dioPost(
      url: url,
      obj: {"content": content},
    );

    globals.getAlertDialog(
      context: _api.currentContext,
      result: result,
      successTitle: "successTitle",
      fail400Title: "fail400Title",
      fail500Title: "fail500Title",
    );
  }
}
