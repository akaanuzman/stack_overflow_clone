import 'dart:io';

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
    Function()? onTap,
  }) {
    if (result?.statusCode == HttpStatus.ok) {
      uiGlobals.showAlertDialog(
        context: context,
        alertEnum: AlertEnum.SUCCESS,
        contentTitle: successTitle,
        contentSubtitle: result?.data['message'],
        buttonLabel: AppLocalizations.of(context)!.okButton,
        onTap: onTap,
      );
    } else if (result?.statusCode == HttpStatus.badRequest) {
      uiGlobals.showAlertDialog(
        context: context,
        alertEnum: AlertEnum.ERROR,
        contentTitle: fail400Title,
        contentSubtitle: result?.data['message'],
        buttonLabel: AppLocalizations.of(context)!.okButton,
      );
    } else if (result == null ||
        result.statusCode == HttpStatus.internalServerError) {
      uiGlobals.showAlertDialog(
        context: context,
        alertEnum: AlertEnum.ERROR,
        contentTitle: fail500Title,
        contentSubtitle: AppLocalizations.of(context)!.unsuccessMessage,
        buttonLabel: AppLocalizations.of(context)!.okButton,
      );
    }
  }

  getSnackBar({
    required Response<dynamic>? result,
    required String successContent,
    required String error404Content,
    required String error500Content,
    required BuildContext context,
  }) {
    if (result?.statusCode == HttpStatus.ok) {
      uiGlobals.showSnackBar(
        content: successContent,
        context: context,
      );
    } else if (result?.statusCode == HttpStatus.badRequest) {
      uiGlobals.showSnackBar(
        content: error404Content,
        context: context,
      );
    } else {
      uiGlobals.showSnackBar(
        content: error500Content,
        context: context,
      );
    }
  }
}
