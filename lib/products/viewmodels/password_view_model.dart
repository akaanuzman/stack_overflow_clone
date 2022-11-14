// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stack_overflow_clone/core/base/base_singleton.dart';
import 'package:stack_overflow_clone/core/helpers/api.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stack_overflow_clone/products/models/password_model.dart';

import '../views/auth/confrim_token_view.dart';
import '../views/auth/login_view.dart';

class PasswordViewModel extends ChangeNotifier with BaseSingleton {
  PasswordModel _token = PasswordModel();
  PasswordModel get token => _token;
  final _api = Api();
  final String baseUrl = "/auth";

  Future<int> forgotPassword(
      {required String email, bool isAgain = false}) async {
    final BuildContext context = _api.currentContext;
    String url = "/forgotPassword";
    final result = await _api.dioPost(
      url: "$baseUrl$url",
      obj: {"email": email},
    );

    try {
      if (result?.statusCode == HttpStatus.ok) {
        _token = PasswordModel.fromJson(result?.data);
      } else {
        _token = PasswordModel();
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();

    globals.getAlertDialog(
      context: context,
      result: result,
      successTitle: AppLocalizations.of(context)!.sendMailSuccess,
      fail400Title: result?.data["message"],
      fail500Title: AppLocalizations.of(context)!.unsuccessMessage,
      onTap: () async {
        Navigator.pop(context);
        if (!isAgain) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ConfrimTokenView(email: email),
            ),
          ).then((value) => null);
        }
      },
    );

    return result?.statusCode ?? 500;
  }

  Future<int> resetPasswordWithToken(
      {required String id, required String password}) async {
    final BuildContext context = _api.currentContext;
    String url = "/resetPassword?resetPasswordToken=$id";
    final result = await _api.dioPost(
      url: "$baseUrl$url",
      obj: {"password": password},
      post: false,
    );

    globals.getAlertDialog(
      context: context,
      result: result,
      successTitle: AppLocalizations.of(context)!.success,
      fail400Title: AppLocalizations.of(context)!.unsuccessMessage,
      fail500Title: AppLocalizations.of(context)!.unsuccessMessage,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginView(),
          ),
        );
      },
    );

    return result?.statusCode ?? 500;
  }
}
