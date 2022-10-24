import 'package:flutter/material.dart';
import 'package:stack_overflow_clone/core/theme/color/my_colors.dart';
import 'package:stack_overflow_clone/uikit/textformfield/special_text_form_field.dart';

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
    TextStyle? labelStyle,
    TextStyle? hintStyle,
    String? initialValue,
    bool readOnly = false,
    TextInputType? keyboardType,
    OutlineInputBorder? enabledBorder,
    OutlineInputBorder? focusedBorder,
  }) : super(
          context: context,
          labelText: labelText,
          prefixIcon: prefixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.instance.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
        );
}
