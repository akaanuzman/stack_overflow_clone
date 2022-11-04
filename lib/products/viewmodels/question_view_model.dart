// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stack_overflow_clone/core/base/base_singleton.dart';
import 'package:stack_overflow_clone/products/models/question_model.dart';

import '../../core/helpers/api.dart';

class QuestionViewModel extends ChangeNotifier with BaseSingleton {
  List<QuestionModel> _questions = [];
  List<QuestionModel> get questions => _questions;
  List<QuestionModel> _searchList = [];
  List<QuestionModel> get searchList => _searchList;
  QuestionModel _question = QuestionModel();
  QuestionModel get question => _question;
  final String baseUrl = "/questions";
  final _api = Api();

  Future<void> get getAllQuestions async {
    String url = "$baseUrl/allQuestions";
    final result = await _api.dioGet(url: url);

    if (result?.statusCode == HttpStatus.ok) {
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

  Future<void> getQuestionById({required String id}) async {
    String url = "$baseUrl/getQuestion/$id";
    final result = await _api.dioGet(url: url);
    if (result?.statusCode == HttpStatus.ok) {
      try {
        _question = QuestionModel.fromJson(result?.data["question"]);
      } catch (e) {
        print(e);
      }
    } else {
      _question = QuestionModel();
    }
    notifyListeners();
  }

  Future<void> addNewQuestion({
    required String title,
    required String content,
  }) async {
    final BuildContext context = _api.currentContext;

    String url = "$baseUrl/ask";
    final result = await _api.dioPost(
      url: url,
      obj: {
        "title": title,
        "subtitle": content,
      },
    );

    globals.getAlertDialog(
      context: _api.currentContext,
      result: result,
      successTitle: AppLocalizations.of(context)!.success,
      fail400Title: AppLocalizations.of(context)!.fail,
      fail500Title: AppLocalizations.of(context)!.fail,
      successOnTap: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );

    await getAllQuestions;
  }

  Future<void> favQuestion({required String id}) async {
    final BuildContext context = _api.currentContext;
    String url = "$baseUrl/favQuestion/$id";
    final result = await _api.dioGet(url: url);
    if (result?.statusCode == HttpStatus.ok) {
      uiGlobals.showSnackBar(
        content: AppLocalizations.of(context)!.questionFavSuccess,
        context: _api.currentContext,
      );
    } else if (result?.statusCode == HttpStatus.badRequest) {
      uiGlobals.showSnackBar(
        content: AppLocalizations.of(context)!.questionFavUnsuccess,
        context: _api.currentContext,
      );
    } else {
      uiGlobals.showSnackBar(
        content: AppLocalizations.of(context)!.unsuccessMessage,
        context: _api.currentContext,
      );
    }

    await getQuestionById(id: id);
  }

  Future<void> unFavQuestion({required String id}) async {
    final BuildContext context = _api.currentContext;
    String url = "$baseUrl/unFavQuestion/$id";
    final result = await _api.dioGet(url: url);
    if (result?.statusCode == HttpStatus.ok) {
      uiGlobals.showSnackBar(
        content: AppLocalizations.of(context)!.questionUnfavSuccess,
        context: _api.currentContext,
      );
    } else if (result?.statusCode == HttpStatus.badRequest) {
      uiGlobals.showSnackBar(
        content: AppLocalizations.of(context)!.questionUnfavUnsuccess,
        context: _api.currentContext,
      );
    } else {
      uiGlobals.showSnackBar(
        content: AppLocalizations.of(context)!.unsuccessMessage,
        context: _api.currentContext,
      );
    }

    await getQuestionById(id: id);
  }

  void searchQuestion(String query) {
    if (query.isNotEmpty) {
      final suggestions = questions.where((question) {
        final questionTitle = question.title?.toLowerCase();
        final input = query.toLowerCase();
        return questionTitle?.contains(input) ?? false;
      }).toList();
      _searchList = suggestions;
    }
    notifyListeners();
  }
}
