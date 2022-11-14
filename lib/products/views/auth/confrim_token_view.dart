import 'package:animate_do/animate_do.dart';
import 'package:async_button/async_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../core/base/base_singleton.dart';
import '../../../core/extensions/ui_extensions.dart';
import '../../../features/components/textformfield/otp_text_form_field.dart';
import 'reset_password_with_token_view.dart';
import '../../../uikit/button/special_button.dart';
import '../../../uikit/decoration/special_container_decoration.dart';

import '../../../core/enums/alert_enum.dart';
import '../../../uikit/button/special_async_button.dart';
import '../../viewmodels/password_view_model.dart';

class ConfrimTokenView extends StatelessWidget with BaseSingleton {
  final _firstController = TextEditingController();
  final _secondController = TextEditingController();
  final _thirdController = TextEditingController();
  final _fourthController = TextEditingController();
  final _fivethController = TextEditingController();
  final _sixthController = TextEditingController();

  final String email;
  ConfrimTokenView({
    super.key,
    required this.email,
  });

  Future<void> _verifyToken(BuildContext context) async {
    final pv = Provider.of<PasswordViewModel>(context, listen: false);
    pv.token.userTokenDTO = _firstController.text +
        _secondController.text +
        _thirdController.text +
        _fourthController.text +
        _fivethController.text +
        _sixthController.text;
    if (pv.token.token == int.parse(pv.token.userTokenDTO)) {
      _successVerify(context);
    } else {
      _unsuccessVerify(context);
    }
  }

  Future<void> _successVerify(BuildContext context) async {
    uiGlobals.showAlertDialog(
        context: context,
        alertEnum: AlertEnum.SUCCESS,
        contentTitle: AppLocalizations.of(context)!.success,
        contentSubtitle: AppLocalizations.of(context)!.validResetPassToken,
        buttonLabel: AppLocalizations.of(context)!.okButton,
        onTap: () async {
          Navigator.pop(context);
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResetPasswordWithTokenView(),
            ),
          ).then((value) => null);
        });
  }

  void _unsuccessVerify(BuildContext context) {
    uiGlobals.showAlertDialog(
      context: context,
      alertEnum: AlertEnum.ERROR,
      contentTitle: AppLocalizations.of(context)!.fail,
      contentSubtitle: AppLocalizations.of(context)!.invalidResetPassToken,
      buttonLabel: AppLocalizations.of(context)!.okButton,
    );
  }

  Future<void> _resendNewCode(AsyncButtonStateController btnStateController,
      BuildContext context) async {
    btnStateController.update(ButtonState.loading);
    final pv = Provider.of<PasswordViewModel>(context, listen: false);
    int statusCode = await pv.forgotPassword(
      email: email,
      isAgain: true,
    );
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
          shrinkWrap: shrinkWrap,
          padding: context.padding2x,
          children: [
            _whiteContainer(context),
          ],
        ),
      ),
    );
  }

  Container _whiteContainer(BuildContext context) {
    return Container(
      padding: context.padding2x,
      decoration: SpecialContainerDecoration(context: context),
      width: context.maxFinite,
      child: Column(
        children: [
          context.emptySizedHeightBox2x,
          _logo(context),
          context.emptySizedHeightBox6x,
          _title(context),
          context.emptySizedHeightBox1x,
          _subtitle(context),
          context.emptySizedHeightBox3x,
          _otpFields(context),
          context.emptySizedHeightBox2x,
          _verifyYourTokenButton(context),
          context.emptySizedHeightBox4x,
          _resendNewCodeDesc(context),
          context.emptySizedHeightBox1x,
          _resendNewCodeButton(context),
          context.emptySizedHeightBox3x,
        ],
      ),
    );
  }

  AspectRatio _logo(BuildContext context) {
    double aspectRatio = 7;
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: SvgPicture.asset(AppLocalizations.of(context)!.logoSvg),
    );
  }

  Text _title(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.verification,
      style: context.textTheme.headline6,
    );
  }

  Text _subtitle(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.otpDesc,
      style: context.textTheme.subtitle2!.copyWith(fontWeight: context.fw500),
    );
  }

  Row _otpFields(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OtpTextFormField(
            controller: _firstController,
          ),
        ),
        context.emptySizedWidthBox2x,
        Expanded(
          child: OtpTextFormField(
            controller: _secondController,
          ),
        ),
        context.emptySizedWidthBox2x,
        Expanded(
          child: OtpTextFormField(
            controller: _thirdController,
          ),
        ),
        context.emptySizedWidthBox2x,
        Expanded(
          child: OtpTextFormField(
            controller: _fourthController,
          ),
        ),
        context.emptySizedWidthBox2x,
        Expanded(
          child: OtpTextFormField(
            controller: _fivethController,
          ),
        ),
        context.emptySizedWidthBox2x,
        Expanded(
          child: OtpTextFormField(
            controller: _sixthController,
          ),
        ),
      ],
    );
  }

  SizedBox _verifyYourTokenButton(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.5),
      child: SpecialButton(
        onTap: () async => await _verifyToken(context),
        buttonLabel: AppLocalizations.of(context)!.verifyYourToken,
        borderRadius: context.borderRadius2x,
      ),
    );
  }

  Text _resendNewCodeDesc(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.receiveCode,
      style: context.textTheme.subtitle1!.copyWith(fontWeight: context.fw700),
    );
  }

  SizedBox _resendNewCodeButton(BuildContext context) {
    double dynamicWidth = context.dynamicWidth(0.5);
    return SizedBox(
      width: dynamicWidth,
      child: SpecialAsyncButton(
        bgColor: colors.orangeAccent2,
        onTap: (btnStateController) async =>
            await _resendNewCode(btnStateController, context),
        buttonLabel: AppLocalizations.of(context)!.resendNewCode,
        borderRadius: context.borderRadius2x,
      ),
    );
  }
}
