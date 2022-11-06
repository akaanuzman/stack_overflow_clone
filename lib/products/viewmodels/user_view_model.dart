// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:io';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:stack_overflow_clone/core/base/base_singleton.dart';
import 'package:stack_overflow_clone/core/helpers/api.dart';
import 'package:stack_overflow_clone/products/models/user_model.dart';

import '../../core/helpers/token.dart';

class UserViewModel extends ChangeNotifier with BaseSingleton {
  UserModel _user = UserModel();
  UserModel get user => _user;
  List<Question> _searchList = [];
  List<Question> get searchList => _searchList;

  final _api = Api();

  Future<void> get getMyDetails async {
    final tokenResult = await Token.readToken("userId");
    if (tokenResult != null) {
      String url = "/users/$tokenResult";
      final result = await _api.dioGet(url: url);
      if (result?.statusCode == HttpStatus.ok) {
        try {
          _user = UserModel.fromJson(result?.data["user"]);
        } catch (e) {
          print(e);
        }
      } else {
        _user = UserModel();
      }
      notifyListeners();
    } else {
      print("user id is null");
    }
  }

  Future<void> get updateUser async {
    String url = "/users/edit";
    final BuildContext context = _api.currentContext;
    final result = await _api.dioPost(
      url: url,
      post: false,
      obj: user.toJson(),
    );
    globals.getSnackBar(
      result: result,
      successContent: AppLocalizations.of(context)!.successEdit,
      error404Content: AppLocalizations.of(context)!.unsuccessEdit,
      error500Content: AppLocalizations.of(context)!.unsuccessMessage,
      context: context,
    );
    await getMyDetails;
  }

  void searchQuestion(String query) {
    if (user.question!.isNotEmpty && user.question != null) {
      if (query.isNotEmpty) {
        final suggestions = user.question!.where((question) {
          final questionTitle = question.title?.toLowerCase();
          final input = query.toLowerCase();
          return questionTitle?.contains(input) ?? false;
        }).toList();
        _searchList = suggestions;
      }
    }

    notifyListeners();
  }
}
