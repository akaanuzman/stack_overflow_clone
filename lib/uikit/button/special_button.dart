import 'package:flutter/material.dart';

class SpecialButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? child;
  final String buttonLabel;
  final EdgeInsetsGeometry? padding;
  final Color? bgColor;
  final double? elevation;
  final BorderRadiusGeometry borderRadius;
  final bool isHasIcon;
  final IconData icon;
  final Color? iconColor;
  final double? iconSize;
  const SpecialButton({
    super.key,
    this.onTap,
    this.child,
    this.buttonLabel = "Label",
    this.padding,
    this.bgColor,
    this.elevation,
    this.borderRadius = BorderRadius.zero,
    this.isHasIcon = false,
    this.icon = Icons.abc,
    this.iconColor,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return !isHasIcon ? _button : _buttonWihtIcon;
  }

  ElevatedButton get _button {
    return ElevatedButton(
      onPressed: onTap ?? () {},
      style: _buttonStyle,
      child: child ?? Text(buttonLabel),
    );
  }

  ElevatedButton get _buttonWihtIcon {
    return ElevatedButton.icon(
      onPressed: onTap ?? () {},
      icon: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
      label: child ?? Text(buttonLabel),
      style: _buttonStyle,
    );
  }

  ButtonStyle get _buttonStyle {
    return ElevatedButton.styleFrom(
      padding: padding,
      backgroundColor: bgColor,
      elevation: elevation,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
    );
  }
}
