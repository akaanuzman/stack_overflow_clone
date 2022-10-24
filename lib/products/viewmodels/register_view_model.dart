// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:stack_overflow_clone/core/base/base_singleton.dart';
import 'package:stack_overflow_clone/core/enums/alert_enum.dart';
import 'package:stack_overflow_clone/core/helpers/api.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../views/auth/login_view.dart';

class RegisterViewModel extends ChangeNotifier with BaseSingleton {
  final _api = Api();

  Future<void> register({
    required String name,
    required String lastname,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    String url = "/auth/register";
    final result = await _api.dioPost(
      url: url,
      obj: {
        "name": name,
        "lastname": lastname,
        "email": email,
        "password": password,
      },
      useToken: false,
    );

    /// TODO: MAKE DYNAMIC FUNCTION
    if (result?.statusCode == 200) {
      uiGlobals.showAlertDialog(
        context: context,
        alertEnum: AlertEnum.SUCCESS,
        contentTitle: AppLocalizations.of(context)!.registerSuccess,
        contentSubtitle: result?.data["message"],
        buttonLabel: AppLocalizations.of(context)!.okButton,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginView(),
          ),
        ),
      );
    } else if (result?.statusCode == 400) {
      uiGlobals.showAlertDialog(
        context: context,
        alertEnum: AlertEnum.ERROR,
        contentTitle: AppLocalizations.of(context)!.registerFail,
        contentSubtitle: result?.data["message"],
        buttonLabel: AppLocalizations.of(context)!.okButton,
      );
    } else {
      uiGlobals.showAlertDialog(
        context: context,
        alertEnum: AlertEnum.ERROR,
        contentTitle: AppLocalizations.of(context)!.registerFail,
        contentSubtitle: AppLocalizations.of(context)!.failContent,
        buttonLabel: AppLocalizations.of(context)!.okButton,
      );
    }
  }
}
