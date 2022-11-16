import 'package:flutter/material.dart';
import 'package:stack_overflow_clone/core/base/base_singleton.dart';
import 'package:stack_overflow_clone/core/extensions/ui_extensions.dart';

class LikeAndUserInfo extends StatelessWidget with BaseSingleton {
  final VoidCallback onPressed;
  final Color likeColor;
  final String favLength;
  final String createdAt;
  final String username;
  const LikeAndUserInfo({
    super.key,
    required this.onPressed,
    required this.likeColor,
    required this.favLength,
    required this.createdAt,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.favorite,
                  color: likeColor,
                ),
              ),
              context.emptySizedWidthBox2x,
              Expanded(
                child: Text(
                  favLength,
                  style: context.textTheme.subtitle1!.copyWith(
                    fontWeight: context.fw700,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Wrap(
            children: [
              Column(
                crossAxisAlignment: context.crossAxisAStart,
                children: [
                  Text(
                    createdAt,
                    style: context.textTheme.caption!
                        .copyWith(color: colors.blue6),
                  ),
                  Text(
                    username,
                    style: context.textTheme.caption!
                        .copyWith(color: colors.blue8),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
