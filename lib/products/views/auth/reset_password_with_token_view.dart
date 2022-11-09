import 'package:animate_do/animate_do.dart';
import 'package:async_button/async_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:stack_overflow_clone/core/base/base_singleton.dart';
import 'package:stack_overflow_clone/core/extensions/ui_extensions.dart';
import 'package:stack_overflow_clone/products/components/textformfield/default_text_form_field.dart';
import 'package:stack_overflow_clone/uikit/button/special_async_button.dart';
import 'package:stack_overflow_clone/uikit/decoration/special_container_decoration.dart';

import '../../viewmodels/password_view_model.dart';

class ResetPasswordWithTokenView extends StatelessWidget with BaseSingleton {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _passwordV2Controller = TextEditingController();
  ResetPasswordWithTokenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeInDown(
          child: Text(AppLocalizations.of(context)!.resetPassword),
        ),
      ),
      body: FadeInUp(
        child: Form(
          key: _formKey,
          child: Center(
            child: ListView(
              shrinkWrap: true,
              padding: context.padding2x,
              children: [
                Container(
                  padding: context.padding2x,
                  decoration: SpecialContainerDecoration(context: context),
                  child: Column(
                    children: [
                      context.emptySizedHeightBox2x,
                      Text(
                        AppLocalizations.of(context)!
                            .youCanChangePasswordThisPage,
                        style: context.textTheme.subtitle1!
                            .copyWith(fontWeight: context.fw700),
                      ),
                      context.emptySizedHeightBox3x,
                      DefaultTextFormField(
                        context: context,
                        labelText: AppLocalizations.of(context)!.passwordLabel,
                        prefixIcon: const Icon(Icons.lock),
                        controller: _passwordController,
                        obscureText: true,
                        validator: (password) =>
                            validators.passwordCheck(password),
                      ),
                      context.emptySizedHeightBox2x,
                      DefaultTextFormField(
                        context: context,
                        labelText:
                            AppLocalizations.of(context)!.passwordLabelV2,
                        prefixIcon: const Icon(Icons.lock),
                        controller: _passwordV2Controller,
                        obscureText: true,
                        validator: (password) => validators.twoPasswordCheck(
                            password, _passwordController.text),
                      ),
                      context.emptySizedHeightBox2x,
                      SizedBox(
                        width: double.maxFinite,
                        child: SpecialAsyncButton(
                          onTap: (btnStateController) async {
                            btnStateController.update(ButtonState.loading);

                            _formKey.currentState!.save();

                            if (_formKey.currentState!.validate()) {
                              final pv = Provider.of<PasswordViewModel>(context,
                                  listen: false);
                              int statusCode = await pv.resetPasswordWithToken(
                                id: pv.token.userTokenDTO,
                                password: _passwordController.text,
                              );
                              statusCode == 200
                                  ? btnStateController
                                      .update(ButtonState.success)
                                  : btnStateController
                                      .update(ButtonState.failure);
                            } else {
                              btnStateController.update(ButtonState.failure);
                            }
                          },
                          buttonLabel:
                              AppLocalizations.of(context)!.changePassword,
                          borderRadius: context.borderRadius2x,
                        ),
                      ),
                      context.emptySizedHeightBox2x,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
