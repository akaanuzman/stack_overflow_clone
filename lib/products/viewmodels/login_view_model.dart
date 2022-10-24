// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:stack_overflow_clone/core/base/base_singleton.dart';
import 'package:stack_overflow_clone/core/enums/alert_enum.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/helpers/api.dart';

class LoginViewModel extends ChangeNotifier with BaseSingleton {
  final _api = Api();

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    String url = "/auth/login";
    final result = await _api.dioPost(
      url: url,
      obj: {
        "email": email,
        "password": password,
      },
      useToken: false,
    );

    if (result?.statusCode == 200) {
      uiGlobals.showAlertDialog(
        context: context,
        alertEnum: AlertEnum.SUCCESS,
        contentTitle: AppLocalizations.of(context)!.loginSuccess,
        contentSubtitle: result?.data['message'],
        buttonLabel: AppLocalizations.of(context)!.okButton,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Scaffold(),
          ),
        ),
      );
    } else {
      uiGlobals.showAlertDialog(
        context: context,
        alertEnum: AlertEnum.ERROR,
        contentTitle: AppLocalizations.of(context)!.loginFail,
        contentSubtitle: result?.data['message'],
        buttonLabel: AppLocalizations.of(context)!.okButton,
      );
    }
  }
}
