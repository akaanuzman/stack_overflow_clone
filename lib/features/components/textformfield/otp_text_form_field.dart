import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:stack_overflow_clone/core/base/base_singleton.dart';
import 'package:stack_overflow_clone/core/extensions/ui_extensions.dart';

import '../../../products/viewmodels/password_view_model.dart';

class OtpTextFormField extends StatelessWidget with BaseSingleton {
  OtpTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final pv = Provider.of<PasswordViewModel>(context, listen: false);

    return TextFormField(
      onChanged: (value) {
        pv.token.userTokenDTO += value;
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        } else if (value.isEmpty) {
          pv.token.userTokenDTO = pv.token.userTokenDTO
              .substring(0, pv.token.userTokenDTO.length - 1);
          FocusScope.of(context).previousFocus();
        }
      },
      style: context.textTheme.subtitle1!.copyWith(fontWeight: context.fw700),
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
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
    );
  }
}
