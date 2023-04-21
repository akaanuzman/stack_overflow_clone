// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:stack_overflow_clone/core/base/base_singleton.dart';
import 'package:stack_overflow_clone/products/views/common/navbar_view.dart';

import '../../core/helpers/api.dart';
import '../../core/helpers/token.dart';
import 'api_view_model.dart';

class LoginViewModel extends ChangeNotifier with BaseSingleton {
  final _api = Api();

  Future<int> login({
    required String email,
    required String password,
  }) async {
    final BuildContext context = _api.currentContext;
    String url = "/auth/login";
    final result = await _api.dioPost(
      url: url,
      obj: {
        "email": email,
        "password": password,
      },
      useToken: false,
    );

    globals.getAlertDialog(
      context: context,
      result: result,
      successTitle: AppLocalizations.of(context)!.loginSuccess,
      fail400Title: AppLocalizations.of(context)!.loginFail,
      fail500Title: AppLocalizations.of(context)!.loginFail,
      onTap: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => NavbarView(),
          ),
          (route) => false,
        );
      },
    );

    if (result?.statusCode == HttpStatus.ok) {
      Token.saveToken(token: result?.data['token'], key: "login");
      Token.saveToken(token: result?.data['body']['_id'], key: "userId");
      final apv = Provider.of<ApiViewModel>(context, listen: false);
      await apv.getAllApi;
    }

    return result?.statusCode ?? 500;
  }
}
