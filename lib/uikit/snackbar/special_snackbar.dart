import '../../core/extensions/ui_extensions.dart';
import '../../core/theme/color/my_colors.dart';
import 'package:flutter/material.dart';

class SpecialSnackbar extends SnackBar {
  SpecialSnackbar({
    Key? key,
    required BuildContext context,
    required String content,
    Color? contentColor,
    Color? bgColor,
    String actionLabel = "Kapat",
  }) : super(
          content: Text(
            content,
            style: context.textTheme.bodyText1!
                .copyWith(color: contentColor ?? MyColors.instance.white),
          ),
          action: SnackBarAction(
            label: actionLabel,
            onPressed: () {},
            textColor: MyColors.instance.white,
          ),
          duration: context.durationSlow1x,
          backgroundColor: bgColor,
          key: key,
        );
}
