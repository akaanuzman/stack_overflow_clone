import 'package:flutter/material.dart';

import '../../core/theme/color/my_colors.dart';

// Component that provides shadow in the design

class SpecialBoxShadow extends BoxShadow {
  SpecialBoxShadow({
    Color? color,
    double? blurRadius,
  }) : super(
          color: color ?? MyColors.instance.primaryBoxShadowColor,
          offset: const Offset(0, 0),
          blurRadius: blurRadius ?? 30,
          spreadRadius: 0,
        );
}
