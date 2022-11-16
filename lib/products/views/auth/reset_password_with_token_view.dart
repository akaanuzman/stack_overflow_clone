import 'package:animate_do/animate_do.dart';
import 'package:async_button/async_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../core/base/base_singleton.dart';
import '../../../core/extensions/ui_extensions.dart';
import '../../../features/components/textformfield/default_text_form_field.dart';
import '../../../uikit/button/special_async_button.dart';
import '../../../uikit/decoration/special_container_decoration.dart';

import '../../viewmodels/password_view_model.dart';

class ResetPasswordWithTokenView extends StatelessWidget with BaseSingleton {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _passwordV2Controller = TextEditingController();
  ResetPasswordWithTokenView({super.key});

  Future<void> _changePassword(AsyncButtonStateController btnStateController,
      BuildContext context) async {
    btnStateController.update(ButtonState.loading);
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      final pv = Provider.of<PasswordViewModel>(context, listen: false);
      int statusCode = await pv.resetPasswordWithToken(
        id: pv.token.userTokenDTO,
        password: _passwordController.text,
      );
      statusCode == 200
          ? btnStateController.update(ButtonState.success)
          : btnStateController.update(ButtonState.failure);
    } else {
      btnStateController.update(ButtonState.failure);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: FadeInDown(
        child: Text(AppLocalizations.of(context)!.resetPassword),
      ),
    );
  }

  FadeInUp _body(BuildContext context) {
    bool shrinkWrap = true;
    return FadeInUp(
      child: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            shrinkWrap: shrinkWrap,
            padding: context.padding2x,
            children: [
              _whiteContainer(context),
            ],
          ),
        ),
      ),
    );
  }

  Container _whiteContainer(BuildContext context) {
    return Container(
      padding: context.padding2x,
      decoration: SpecialContainerDecoration(context: context),
      child: Column(
        children: [
          context.emptySizedHeightBox2x,
          _changePasswordDesc(context),
          context.emptySizedHeightBox3x,
          _passowordField(context),
          context.emptySizedHeightBox2x,
          _passwordV2Field(context),
          context.emptySizedHeightBox2x,
          _changePasswordButton(context),
          context.emptySizedHeightBox2x,
        ],
      ),
    );
  }

  Text _changePasswordDesc(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.youCanChangePasswordThisPage,
      style: context.textTheme.subtitle1!.copyWith(fontWeight: context.fw700),
    );
  }

  DefaultTextFormField _passowordField(BuildContext context) {
    bool obscureText = true;
    return DefaultTextFormField(
      context: context,
      labelText: AppLocalizations.of(context)!.passwordLabel,
      prefixIcon: icons.lock,
      controller: _passwordController,
      obscureText: obscureText,
      validator: (password) => validators.passwordCheck(password),
    );
  }

  DefaultTextFormField _passwordV2Field(BuildContext context) {
    bool obscureText = true;
    return DefaultTextFormField(
      context: context,
      labelText: AppLocalizations.of(context)!.passwordLabelV2,
      prefixIcon: icons.lock,
      controller: _passwordV2Controller,
      obscureText: obscureText,
      validator: (password) =>
          validators.twoPasswordCheck(password, _passwordController.text),
    );
  }

  SizedBox _changePasswordButton(BuildContext context) {
    return SizedBox(
      width: context.maxFinite,
      child: SpecialAsyncButton(
        onTap: (btnStateController) async =>
            await _changePassword(btnStateController, context),
        buttonLabel: AppLocalizations.of(context)!.changePassword,
        borderRadius: context.borderRadius2x,
      ),
    );
  }
}
