import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/base/base_singleton.dart';
import '../../../core/extensions/ui_extensions.dart';

class OtpTextFormField extends StatelessWidget with BaseSingleton {
  final TextEditingController controller;
  OtpTextFormField({
    super.key,
    required this.controller,
  });

  void goForwordAndBackwardInFields(BuildContext context, String value) {
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    } else if (value.isEmpty) {
      FocusScope.of(context).previousFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => goForwordAndBackwardInFields(context, value),
      style: context.textTheme.subtitle1!.copyWith(fontWeight: context.fw700),
      keyboardType: context.keyboardNumber,
      textAlign: context.taCenter,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
      ],
      cursorColor: colors.transparent,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        hintText: "X",
      ),
      controller: controller,
    );
  }
}
