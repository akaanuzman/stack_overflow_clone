import 'package:flutter/material.dart';
import '../../../core/base/base_singleton.dart';
import '../../../core/extensions/ui_extensions.dart';

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
          child: favButtonAndFavLength(context),
        ),
        Expanded(
          child: createdAtAndUsernameText(context),
        ),
      ],
    );
  }

  Row favButtonAndFavLength(BuildContext context) {
    return Row(
      children: [
        favButton,
        context.emptySizedWidthBox2x,
        Expanded(
          child: favLengthText(context),
        ),
      ],
    );
  }

  IconButton get favButton {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.favorite,
        color: likeColor,
      ),
    );
  }

  Text favLengthText(BuildContext context) {
    return Text(
      favLength,
      style: context.textTheme.subtitle1!.copyWith(
        fontWeight: context.fw700,
      ),
    );
  }

  Wrap createdAtAndUsernameText(BuildContext context) {
    return Wrap(
      children: [
        Column(
          crossAxisAlignment: context.crossAxisAStart,
          children: [
            createdAtText(context),
            userNameText(context),
          ],
        )
      ],
    );
  }

  Text createdAtText(BuildContext context) {
    return Text(
      createdAt,
      style: context.textTheme.caption!.copyWith(color: colors.blue6),
    );
  }

  Text userNameText(BuildContext context) {
    return Text(
      username,
      style: context.textTheme.caption!.copyWith(color: colors.blue8),
    );
  }
}
