import 'package:flutter/material.dart';

import '../../uikit/alert/special_alert.dart';
import '../enums/alert_enum.dart';
import '../theme/color/my_colors.dart';

extension AlertExtension on AlertEnum {
  SpecialAlert getAlert({
    required String contentTitle,
    required String contentSubtitle,
    required String buttonLabel,
    Function()? onTap,
    bool isHasActions = false,
    String? secondButtonLabel,
    Function()? secondActionOnTap,
  }) {
    switch (this) {
      case AlertEnum.SUCCESS:
        return SpecialAlert(
          icon: Icons.check,
          titleBgColor: MyColors.instance.greenAccent4,
          circleAvatarBgColor: MyColors.instance.greenAccent7,
          contentTitle: contentTitle,
          contentSubtitle: contentSubtitle,
          buttonLabel: buttonLabel,
          onTap: onTap,
        );
      case AlertEnum.ERROR:
        return SpecialAlert(
          icon: Icons.do_disturb,
          titleBgColor: MyColors.instance.redAccent4,
          circleAvatarBgColor: MyColors.instance.redAccent7,
          contentTitle: contentTitle,
          contentSubtitle: contentSubtitle,
          buttonLabel: buttonLabel,
          onTap: onTap,
        );
      case AlertEnum.WARN:
        return SpecialAlert(
          icon: Icons.error_outline_sharp,
          titleBgColor: MyColors.instance.amberAccent4,
          circleAvatarBgColor: MyColors.instance.amberAccent7,
          contentTitle: contentTitle,
          contentSubtitle: contentSubtitle,
          buttonLabel: buttonLabel,
          onTap: onTap,
        );
      case AlertEnum.INFO:
        return SpecialAlert(
          icon: Icons.lightbulb,
          titleBgColor: MyColors.instance.yellowAccent4,
          circleAvatarBgColor: MyColors.instance.yellowAccent7,
          contentTitle: contentTitle,
          contentSubtitle: contentSubtitle,
          buttonLabel: buttonLabel,
          onTap: onTap,
        );
      case AlertEnum.AREUSURE:
        return SpecialAlert(
          icon: Icons.done_outline_outlined,
          titleBgColor: MyColors.instance.tealAccent2,
          circleAvatarBgColor: MyColors.instance.tealAccent7,
          contentTitle: contentTitle,
          contentSubtitle: contentSubtitle,
          buttonLabel: buttonLabel,
          onTap: onTap,
          isHasActions: true,
          secondButtonLabel: secondButtonLabel,
          secondActionOnTap: secondActionOnTap,
        );
    }
  }
}
