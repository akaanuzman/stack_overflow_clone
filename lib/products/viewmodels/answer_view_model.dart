// ignore_for_file: avoid_print, use_build_context_synchronously, curly_braces_in_flow_control_structures

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:stack_overflow_clone/core/base/base_singleton.dart';
import 'package:stack_overflow_clone/core/helpers/api.dart';
import 'package:stack_overflow_clone/products/models/answer_model.dart';
import 'package:stack_overflow_clone/products/viewmodels/question_view_model.dart';

import 'user_view_model.dart';

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

  Future<int> addAnswer({
    required String qId,
    required String content,
  }) async {
    final BuildContext context = _api.currentContext;
    final String url = "/questions/$qId/answers/";
    final result = await _api.dioPost(
      url: url,
      obj: {"content": content},
    );

    globals.getAlertDialog(
      context: _api.currentContext,
      result: result,
      successTitle: AppLocalizations.of(context)!.success,
      fail400Title: AppLocalizations.of(context)!.fail,
      fail500Title: AppLocalizations.of(context)!.fail,
      onTap: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );
    final upv = Provider.of<UserViewModel>(context, listen: false);
    final qpv = Provider.of<QuestionViewModel>(context, listen: false);
    await Future.wait(
      [
        upv.getMyDetails,
        qpv.getAllQuestions,
        getAllAnswers(qId: qId),
      ],
    );

    return result?.statusCode ?? 500;
  }

  Future<int> editAnswer({
    required String qId,
    required String aId,
    required String content,
  }) async {
    final BuildContext context = _api.currentContext;
    final String url = "/questions/$qId/answers/$aId";
    final result = await _api.dioPost(
      url: url,
      obj: {"content": content},
      post: false,
    );

    globals.getSnackBar(
      result: result,
      successContent: AppLocalizations.of(context)!.successEdit,
      error404Content: AppLocalizations.of(context)!.unsuccessEdit,
      error500Content: AppLocalizations.of(context)!.unsuccessMessage,
      context: context,
    );

    final upv = Provider.of<UserViewModel>(context, listen: false);
    await Future.wait(
      [
        getAllAnswers(qId: qId),
        upv.getMyDetails,
      ],
    );

    return result?.statusCode ?? 500;
  }

  Future<void> deleteAnswer({
    required String qId,
    required String aId,
  }) async {
    final BuildContext context = _api.currentContext;
    final String url = "/questions/$qId/answers/$aId";
    final result = await _api.dioGet(
      url: url,
      get: false,
    );

    final upv = Provider.of<UserViewModel>(context, listen: false);
    final qpv = Provider.of<QuestionViewModel>(context, listen: false);
    await Future.wait(
      [
        upv.getMyDetails,
        getAllAnswers(qId: qId),
        qpv.getAllQuestions,
      ],
    ).then((value) {
      globals.getSnackBar(
        result: result,
        successContent: AppLocalizations.of(context)!.deleteQuestionSuccess,
        error404Content: result?.data["message"],
        error500Content: AppLocalizations.of(context)!.unsuccessMessage,
        context: context,
      );
    });
  }

  Future<void> favUnFavAnswer({
    required String qId,
    required String aId,
    bool isFav = true,
  }) async {
    final BuildContext context = _api.currentContext;
    String url = isFav
        ? "/questions/$qId/answers/$aId/favAnswer"
        : "/questions/$qId/answers/$aId/unFavAnswer";
    final result = await _api.dioGet(url: url);

    globals.getSnackBar(
      result: result,
      successContent: isFav
          ? AppLocalizations.of(context)!.answerFavSuccess
          : AppLocalizations.of(context)!.answerUnfavSuccess,
      error404Content: isFav
          ? AppLocalizations.of(context)!.answerFavUnsuccess
          : AppLocalizations.of(context)!.answerUnfavUnsuccess,
      error500Content: AppLocalizations.of(context)!.unsuccessMessage,
      context: context,
    );

    await getAllAnswers(qId: qId);
  }

  Color isFavAnswer(
    AnswerModel answerModel,
    BuildContext context,
  ) {
    final upv = Provider.of<UserViewModel>(context, listen: false);
    if (answerModel.fav != null) {
      for (var e in answerModel.fav!) {
        if (upv.user.sId == e.sId) {
          return colors.redAccent;
        } else
          return colors.grey;
      }
    } else
      return colors.grey;
    return colors.grey;
  }

  Future<void> answerFavOperation({
    required AnswerModel answerModel,
    required BuildContext context,
    required AnswerViewModel pv,
    required String qId,
    required String aId,
  }) async {
    final Color color = isFavAnswer(answerModel, context);
    if (color == colors.redAccent) {
      await pv.favUnFavAnswer(
        qId: qId,
        aId: aId,
        isFav: false,
      );
    } else {
      await pv.favUnFavAnswer(
        qId: qId,
        aId: aId,
      );
    }
  }
}
