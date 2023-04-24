import 'package:animate_do/animate_do.dart';
import 'package:async_button/async_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../core/base/base_singleton.dart';
import '../../../core/extensions/ui_extensions.dart';
import '../../../features/components/textformfield/default_text_form_field.dart';
import '../../../uikit/button/special_async_button.dart';
import '../../../uikit/decoration/special_container_decoration.dart';

import '../../viewmodels/password_view_model.dart';

class ForgotPasswordView extends StatelessWidget with BaseSingleton {
  final _emailController = TextEditingController();
  ForgotPasswordView({super.key});

  Future<void> _sendRecoveryMail(
      AsyncButtonStateController btnStateController, context) async {
    btnStateController.update(ButtonState.loading);
    final pv = Provider.of<PasswordViewModel>(context, listen: false);
    int statusCode = await pv.forgotPassword(email: _emailController.text);
    statusCode == 200
        ? btnStateController.update(ButtonState.success)
        : btnStateController.update(ButtonState.failure);
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
        child: Text(AppLocalizations.of(context)!.forgotPassword),
      ),
    );
  }

  FadeInUp _body(BuildContext context) {
    bool shrinkWrap = true;
    return FadeInUp(
      child: Center(
        child: ListView(
          padding: context.padding4x,
          shrinkWrap: shrinkWrap,
          children: [
            _logo(context),
            context.emptySizedHeightBox2x,
            _forgotPasswordSection(context)
          ],
        ),
      ),
    );
  }

  SvgPicture _logo(BuildContext context) =>
      SvgPicture.asset(AppLocalizations.of(context)!.logoSvg);

  Container _forgotPasswordSection(BuildContext context) {
    return Container(
      padding: context.padding3x,
      decoration: SpecialContainerDecoration(context: context),
      child: Column(
        children: [
          context.emptySizedHeightBox1x,
          Text(AppLocalizations.of(context)!.forgotPasswordDesc),
          context.emptySizedHeightBox2x,
          _emailField(context),
          context.emptySizedHeightBox3x,
          _sendRecoveryMailButton(context)
        ],
      ),
    );
  }

  DefaultTextFormField _emailField(BuildContext context) {
    return DefaultTextFormField(
      context: context,
      labelText: AppLocalizations.of(context)!.emailLabel,
      prefixIcon: icons.email,
      controller: _emailController,
    );
  }

  SizedBox _sendRecoveryMailButton(BuildContext context) {
    return SizedBox(
      width: context.maxFinite,
      child: SpecialAsyncButton(
        onTap: (btnStateController) async =>
            await _sendRecoveryMail(btnStateController, context),
        buttonLabel: AppLocalizations.of(context)!.sendRecoveryMail,
        borderRadius: context.borderRadius2x,
      ),
    );
  }
}
