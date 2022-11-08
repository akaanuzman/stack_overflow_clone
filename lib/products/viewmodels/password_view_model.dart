// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:stack_overflow_clone/core/base/base_singleton.dart';
import 'package:stack_overflow_clone/core/helpers/api.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PasswordViewModel extends ChangeNotifier with BaseSingleton {
  final _api = Api();

  Future<int> forgotPassword({required String email}) async {
    final BuildContext context = _api.currentContext;
    final String url = "/auth/forgotPassword";
    final result = await _api.dioPost(
      url: url,
      obj: {"email": email},
    );

    globals.getAlertDialog(
      context: context,
      result: result,
      successTitle: AppLocalizations.of(context)!.sendMailSuccess,
      fail400Title: result?.data["message"],
      fail500Title: AppLocalizations.of(context)!.unsuccessMessage,
    );

    return result?.statusCode ?? 500;
  }
}
