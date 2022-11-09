import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../core/base/base_singleton.dart';
import '../../core/extensions/ui_extensions.dart';
import '../../core/theme/color/my_colors.dart';
import '../button/special_button.dart';

class SpecialAlert extends StatelessWidget with BaseSingleton {
  final Color? titleBgColor;
  final Color? circleAvatarBgColor;
  final IconData icon;
  final String contentTitle;
  final String contentSubtitle;
  final String buttonLabel;
  final Function()? onTap;
  final bool isHasActions;
  final String? secondButtonLabel;
  final Function()? secondActionOnTap;

  const SpecialAlert({
    super.key,
    this.titleBgColor,
    this.circleAvatarBgColor,
    required this.icon,
    required this.contentTitle,
    required this.contentSubtitle,
    required this.buttonLabel,
    this.onTap,
    this.isHasActions = false,
    this.secondButtonLabel,
    this.secondActionOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: context.borderRadius10x),
      titlePadding: EdgeInsets.zero,
      title: _title(context),
      content: _content(context),
      contentPadding: EdgeInsets.only(top: context.val2x),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        if (isHasActions) ...[
          FadeInUp(
            child: ElevatedButton(
              onPressed: secondActionOnTap ??
                  () {
                    Navigator.pop(context);
                  },
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: context.borderRadius10x),
              ),
              child: Text(secondButtonLabel ?? "null_value"),
            ),
          ),
          FadeInUp(
            child: SpecialButton(
              onTap: onTap ??
                  () {
                    Navigator.pop(context);
                  },
              buttonLabel: buttonLabel,
              borderRadius: context.borderRadius10x,
            ),
          ),
        ] else ...[
          _onlyOneAction(context),
        ]
      ],
    );
  }

  Widget _title(BuildContext context) {
    return FadeInDown(
      child: Container(
        alignment: Alignment.center,
        padding: context.padding4x,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: context.radius10x, topRight: context.radius10x),
          color: titleBgColor,
        ),
        child: _circleAatarInIcon(),
      ),
    );
  }

  SizedBox _circleAatarInIcon() {
    return SizedBox(
      width: 100,
      height: 100,
      child: CircleAvatar(
        backgroundColor: circleAvatarBgColor,
        child: Icon(
          icon,
          color: MyColors.instance.white,
          size: 60,
        ),
      ),
    );
  }

  Padding _content(BuildContext context) {
    return Padding(
      padding: context.paddingHorizontal2x,
      child: FadeInUp(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _contentTile(context),
            context.emptySizedHeightBox1x,
            _contentSubtitle(context),
            context.emptySizedHeightBox1x,
          ],
        ),
      ),
    );
  }

  Widget _contentTile(BuildContext context) {
    return Text(
      contentTitle,
      style: context.textTheme.subtitle1!.copyWith(
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _contentSubtitle(BuildContext context) {
    return Text(
      contentSubtitle,
      style: context.textTheme.subtitle2,
      textAlign: TextAlign.center,
    );
  }

  Widget _onlyOneAction(BuildContext context) {
    return FadeInUp(
      child: SpecialButton(
        onTap: onTap ??
            () {
              Navigator.pop(context);
            },
        borderRadius: context.borderRadius10x,
        buttonLabel: buttonLabel,
      ),
    );
  }
}
