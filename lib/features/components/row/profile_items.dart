import 'package:flutter/material.dart';
import '../../../core/base/base_singleton.dart';
import '../../../core/extensions/ui_extensions.dart';
import '../../../uikit/decoration/special_container_decoration.dart';

class ProfileItems extends StatelessWidget with BaseSingleton {
  final String title;
  final String action;
  final VoidCallback acitonOnTap;
  final String description;
  const ProfileItems({
    super.key,
    required this.title,
    required this.action,
    required this.acitonOnTap,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: context.mainAxisASpaceBetween,
          children: [
            Text(
              title,
              style: context.textTheme.headline6,
            ),
            TextButton(
              onPressed: acitonOnTap,
              child: Text(
                action,
                style:
                    context.textTheme.headline6!.copyWith(color: colors.blue),
              ),
            )
          ],
        ),
        context.emptySizedHeightBox2x,
        Container(
          padding: context.padding4x,
          decoration: SpecialContainerDecoration(context: context),
          alignment: context.alignmentCenter,
          child: Text(
            description,
          ),
        ),
      ],
    );
  }
}
