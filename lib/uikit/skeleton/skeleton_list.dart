// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:stack_overflow_clone/core/base/base_singleton.dart';
import 'package:stack_overflow_clone/core/extensions/ui_extensions.dart';
import 'package:stack_overflow_clone/uikit/decoration/special_container_decoration.dart';
import 'package:stack_overflow_clone/uikit/skeleton/skeleton_item.dart';

class SkeletonList extends StatelessWidget with BaseSingleton {
  int itemCount;
  SkeletonList({
    super.key,
    this.itemCount = 10,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => context.emptySizedHeightBox2x,
      padding: context.padding3x,
      itemCount: itemCount,
      itemBuilder: (context, index) => _item(context),
    );
  }

  FadeInUp _item(BuildContext context) {
    return FadeInUp(
      child: Shimmer(
        child: _container(context),
      ),
    );
  }

  Container _container(BuildContext context) {
    return Container(
      padding: context.padding1x,
      decoration: SpecialContainerDecoration(context: context),
      child: ListTile(
        leading: _leading,
        title: SkeletonItem(context: context),
        subtitle: _subtitle(context),
      ),
    );
  }

  SizedBox get _leading {
    return SizedBox(
      width: 60,
      height: 60,
      child: CircleAvatar(
        backgroundColor: colors.grey4,
      ),
    );
  }

  Padding _subtitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.val2x),
      child: SkeletonItem(
        context: context,
        aspectRatio: 4.5,
      ),
    );
  }
}
