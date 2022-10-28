import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../base/base_singleton.dart';
import '../enums/alert_enum.dart';

class Globals with BaseSingleton {
  static Globals? _instance;
  static Globals get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = Globals.init();
      return _instance!;
    }
  }

  Globals.init();

  formatDate(String? s) {
    if (s == null) return "Tarih yok";
    var now = DateFormat('yyyy-MM-dd HH:mm:ss').parse(s.replaceAll('T', ' '));

    var day = now.day.toString().length == 1 ? "0${now.day}" : now.day;
    String convertedDateTime =
        "$day.${now.month.toString().padLeft(2, '0')}.${now.year.toString()}";
    return convertedDateTime;
  }

  formatDateWithHour(String? s) {
    if (s == null) return "Tarih yok";
    var now = DateFormat('yyyy-MM-dd HH:mm:ss').parse(s.replaceAll('T', ' '));

    var day = now.day.toString().length == 1 ? "0${now.day}" : now.day;
    String convertedDateTime =
        "$day.${now.month.toString().padLeft(2, '0')}.${now.year.toString()}";
    return convertedDateTime;
  }

  getAlertDialog({
    required BuildContext context,
    required Response<dynamic>? result,
    required String successTitle,
    required String fail400Title,
    required String fail500Title,
    VoidCallback? successOnTap,
  }) {
    if (result?.statusCode == 200) {
      uiGlobals.showAlertDialog(
        context: context,
        alertEnum: AlertEnum.SUCCESS,
        contentTitle: successTitle,
        contentSubtitle: result?.data['message'],
        buttonLabel: AppLocalizations.of(context)!.okButton,
        onTap: successOnTap,
      );
    } else if (result?.statusCode == 400) {
      uiGlobals.showAlertDialog(
        context: context,
        alertEnum: AlertEnum.ERROR,
        contentTitle: fail400Title,
        contentSubtitle: result?.data['message'],
        buttonLabel: AppLocalizations.of(context)!.okButton,
      );
    } else if (result == null || result.statusCode == 500) {
      uiGlobals.showAlertDialog(
        context: context,
        alertEnum: AlertEnum.ERROR,
        contentTitle: fail500Title,
        contentSubtitle: AppLocalizations.of(context)!.failContent,
        buttonLabel: AppLocalizations.of(context)!.okButton,
      );
    }
  }
}
