import 'package:flutter/material.dart';
import 'index.dart';
import '../../../core/theme/color/my_colors.dart';

class DefaultTextFormField extends SpecialTextFormField {
  DefaultTextFormField({
    super.key,
    required BuildContext context,
    required String labelText,
    Widget? prefixIcon,
    IconData? suffixIcon,
    String? hintText,
    bool obscureText = false,
    Color? color,
    VoidCallback? onTap,
    TextEditingController? controller,
    String? Function(String?)? validator,
    Function(String)? onChanged,
    TextStyle? style,
    TextStyle? labelStyle,
    TextStyle? hintStyle,
    String? initialValue,
    bool readOnly = false,
    TextInputType? keyboardType,
    OutlineInputBorder? enabledBorder,
    OutlineInputBorder? focusedBorder,
    bool filled = false,
    Color? fillColor,
    int? minLines,
    int? maxLines,
  }) : super(
          context: context,
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon,
          initialValue: initialValue,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.instance.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.instance.red),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          onChanged: onChanged,
          filled: filled,
          fillColor: fillColor,
          minLines: minLines,
          maxLines: maxLines,
          readOnly: readOnly,
          style: style,
        );
}
