import 'package:animate_do/animate_do.dart';
import 'package:async_button/async_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stack_overflow_clone/uikit/button/special_async_button.dart';

import '../../../core/base/base_singleton.dart';
import '../../../core/extensions/ui_extensions.dart';
import '../../../uikit/decoration/special_container_decoration.dart';
import '../../components/textformfield/default_text_form_field.dart';
import '../../viewmodels/login_view_model.dart';
import 'register_view.dart';

class LoginView extends StatelessWidget with BaseSingleton {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginView({super.key});

  void _signUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  Center _body(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        padding: context.padding6x,
        children: [
          _logoSection(context),
          _loginSection(context),
        ],
      ),
    );
  }

  FadeInDown _logoSection(BuildContext context) {
    return FadeInDown(
      child: SvgPicture.asset(AppLocalizations.of(context)!.logoSvg),
    );
  }

  FadeInUp _loginSection(BuildContext context) {
    return FadeInUp(
      child: Container(
        decoration: SpecialContainerDecoration(context: context),
        padding: context.padding4x,
        margin: context.paddingVertical2x,
        child: Column(
          children: [
            _emailField(context),
            context.emptySizedHeightBox3x,
            _passwordField(context),
            context.emptySizedHeightBox3x,
            _loginButton(context),
            _forgotPasswordButton(context),
            uiGlobals.divider,
            _signUpSection(context)
          ],
        ),
      ),
    );
  }

  DefaultTextFormField _emailField(BuildContext context) {
    return DefaultTextFormField(
      context: context,
      labelText: AppLocalizations.of(context)!.emailLabel,
      prefixIcon: const Icon(Icons.email),
      keyboardType: TextInputType.emailAddress,
      controller: _emailController,
    );
  }

  DefaultTextFormField _passwordField(BuildContext context) {
    return DefaultTextFormField(
      context: context,
      labelText: AppLocalizations.of(context)!.passwordLabel,
      prefixIcon: const Icon(Icons.lock),
      obscureText: true,
      controller: _passwordController,
    );
  }

  Widget _loginButton(BuildContext context) {
    final pv = Provider.of<LoginViewModel>(context, listen: false);
    return SizedBox(
      width: double.maxFinite,
      child: SpecialAsyncButton(
        onTap: (btnStateController) async {
          btnStateController.update(ButtonState.loading);
          int statusCode = await pv.login(
            email: _emailController.text,
            password: _passwordController.text,
          );
          statusCode == 200
              ? btnStateController.update(ButtonState.success)
              : btnStateController.update(ButtonState.failure);
        },
        buttonLabel: AppLocalizations.of(context)!.loginButton,
        borderRadius: context.borderRadius2x,
      ),
    );
  }

  Align _forgotPasswordButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          AppLocalizations.of(context)!.forgotPassword,
          style: context.textTheme.caption!.copyWith(
            color: colors.blue6,
            fontWeight: context.fw700,
          ),
        ),
      ),
    );
  }

  Wrap _signUpSection(BuildContext context) {
    return Wrap(
      crossAxisAlignment: context.wrapCrossACenter,
      children: [
        _signUpDescription(context),
        _signUpButton(context),
      ],
    );
  }

  Text _signUpDescription(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.signUpDesc,
      style: context.textTheme.subtitle2!.copyWith(),
    );
  }

  TextButton _signUpButton(BuildContext context) {
    return TextButton(
      onPressed: () => _signUp(context),
      child: Text(
        AppLocalizations.of(context)!.signUp,
        style: context.textTheme.subtitle2!.copyWith(
          color: colors.blue6,
          fontWeight: context.fw600,
        ),
      ),
    );
  }
}
