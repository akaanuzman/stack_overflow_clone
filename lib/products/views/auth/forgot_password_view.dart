import 'package:animate_do/animate_do.dart';
import 'package:async_button/async_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stack_overflow_clone/core/extensions/ui_extensions.dart';
import 'package:stack_overflow_clone/products/components/textformfield/default_text_form_field.dart';
import 'package:stack_overflow_clone/uikit/button/special_async_button.dart';
import 'package:stack_overflow_clone/uikit/decoration/special_container_decoration.dart';

import '../../viewmodels/password_view_model.dart';

class ForgotPasswordView extends StatelessWidget {
  final _emailController = TextEditingController();
  ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeInDown(
          child: Text(AppLocalizations.of(context)!.forgotPassword),
        ),
      ),
      body: FadeInUp(
        child: Center(
          child: ListView(
            padding: context.padding4x,
            shrinkWrap: true,
            children: [
              SvgPicture.asset(AppLocalizations.of(context)!.logoSvg),
              context.emptySizedHeightBox2x,
              Container(
                padding: context.padding3x,
                decoration: SpecialContainerDecoration(context: context),
                child: Column(
                  children: [
                    context.emptySizedHeightBox1x,
                    Text(AppLocalizations.of(context)!.forgotPasswordDesc),
                    context.emptySizedHeightBox2x,
                    DefaultTextFormField(
                      context: context,
                      labelText: AppLocalizations.of(context)!.emailLabel,
                      prefixIcon: const Icon(Icons.mail),
                      controller: _emailController,
                    ),
                    context.emptySizedHeightBox3x,
                    SizedBox(
                      width: double.maxFinite,
                      child: SpecialAsyncButton(
                        onTap: (btnStateController) async {
                          btnStateController.update(ButtonState.loading);
                          final pv = Provider.of<PasswordViewModel>(context,
                              listen: false);
                          int statusCode = await pv.forgotPassword(
                              email: _emailController.text);
                          statusCode == 200
                              ? btnStateController.update(ButtonState.success)
                              : btnStateController.update(ButtonState.failure);
                        },
                        buttonLabel:
                            AppLocalizations.of(context)!.sendRecoveryMail,
                        borderRadius: context.borderRadius2x,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
