// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stack_overflow_clone/core/base/base_singleton.dart';
import 'package:stack_overflow_clone/core/enums/alert_enum.dart';

import '../../core/helpers/api.dart';
import '../../core/helpers/token.dart';

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

    /// TODO: MAKE DYNAMIC FUNCTION
    _api.getAlertDialog(
      result: result,
      successTitle: AppLocalizations.of(context)!.loginSuccess,
      fail400Title: AppLocalizations.of(context)!.loginFail,
      fail500Title: AppLocalizations.of(context)!.loginFail,
    );
    
    // if (result?.statusCode == 200) {
    //   Token.saveToken(token: result?.data['token'], key: "login");
    //   uiGlobals.showAlertDialog(
    //     context: context,
    //     alertEnum: AlertEnum.SUCCESS,
    //     contentTitle: AppLocalizations.of(context)!.loginSuccess,
    //     contentSubtitle: result?.data['message'],
    //     buttonLabel: AppLocalizations.of(context)!.okButton,
    //     onTap: () => Navigator.pushAndRemoveUntil(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const Scaffold(),
    //       ),
    //       (route) => false,
    //     ),
    //   );
    // } else if (result?.statusCode == 400) {
    //   uiGlobals.showAlertDialog(
    //     context: context,
    //     alertEnum: AlertEnum.ERROR,
    //     contentTitle: AppLocalizations.of(context)!.loginFail,
    //     contentSubtitle: result?.data['message'],
    //     buttonLabel: AppLocalizations.of(context)!.okButton,
    //   );
    // } else {
    //   uiGlobals.showAlertDialog(
    //     context: context,
    //     alertEnum: AlertEnum.ERROR,
    //     contentTitle: AppLocalizations.of(context)!.loginFail,
    //     contentSubtitle: AppLocalizations.of(context)!.failContent,
    //     buttonLabel: AppLocalizations.of(context)!.okButton,
    //   );
    // }
  }
}
