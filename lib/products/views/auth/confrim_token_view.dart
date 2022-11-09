import 'package:animate_do/animate_do.dart';
import 'package:async_button/async_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stack_overflow_clone/core/base/base_singleton.dart';
import 'package:stack_overflow_clone/core/extensions/ui_extensions.dart';
import 'package:stack_overflow_clone/features/components/textformfield/otp_text_form_field.dart';
import 'package:stack_overflow_clone/products/views/auth/reset_password_with_token_view.dart';
import 'package:stack_overflow_clone/uikit/button/special_button.dart';
import 'package:stack_overflow_clone/uikit/decoration/special_container_decoration.dart';

import '../../../core/enums/alert_enum.dart';
import '../../../uikit/button/special_async_button.dart';
import '../../viewmodels/password_view_model.dart';

class ConfrimTokenView extends StatelessWidget with BaseSingleton {
  final String email;
  ConfrimTokenView({
    super.key,
    required this.email,
  });

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
            shrinkWrap: true,
            padding: context.padding2x,
            children: [
              Container(
                padding: context.padding2x,
                decoration: SpecialContainerDecoration(context: context),
                width: double.maxFinite,
                child: Column(
                  children: [
                    context.emptySizedHeightBox2x,
                    AspectRatio(
                      aspectRatio: 7,
                      child: SvgPicture.asset(
                          AppLocalizations.of(context)!.logoSvg),
                    ),
                    context.emptySizedHeightBox6x,
                    Text(
                      AppLocalizations.of(context)!.verification,
                      style: context.textTheme.headline6,
                    ),
                    context.emptySizedHeightBox1x,
                    Text(
                      AppLocalizations.of(context)!.otpDesc,
                      style: context.textTheme.subtitle2!
                          .copyWith(fontWeight: context.fw500),
                    ),
                    context.emptySizedHeightBox3x,
                    Row(
                      children: [
                        Expanded(
                          child: OtpTextFormField(),
                        ),
                        context.emptySizedWidthBox2x,
                        Expanded(
                          child: OtpTextFormField(),
                        ),
                        context.emptySizedWidthBox2x,
                        Expanded(
                          child: OtpTextFormField(),
                        ),
                        context.emptySizedWidthBox2x,
                        Expanded(
                          child: OtpTextFormField(),
                        ),
                        context.emptySizedWidthBox2x,
                        Expanded(
                          child: OtpTextFormField(),
                        ),
                        context.emptySizedWidthBox2x,
                        Expanded(
                          child: OtpTextFormField(),
                        ),
                      ],
                    ),
                    context.emptySizedHeightBox2x,
                    SizedBox(
                      width: context.dynamicWidth(0.5),
                      child: SpecialButton(
                        onTap: () async {
                          final pv = Provider.of<PasswordViewModel>(context,
                              listen: false);
                          if (pv.token.token ==
                              int.parse(pv.token.userTokenDTO)) {
                            uiGlobals.showAlertDialog(
                                context: context,
                                alertEnum: AlertEnum.SUCCESS,
                                contentTitle:
                                    AppLocalizations.of(context)!.success,
                                contentSubtitle: AppLocalizations.of(context)!
                                    .validResetPassToken,
                                buttonLabel:
                                    AppLocalizations.of(context)!.okButton,
                                onTap: () async {
                                  Navigator.pop(context);
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ResetPasswordWithTokenView(),
                                    ),
                                  ).then((value) => null);
                                });
                          } else {
                            uiGlobals.showAlertDialog(
                              context: context,
                              alertEnum: AlertEnum.ERROR,
                              contentTitle: AppLocalizations.of(context)!.fail,
                              contentSubtitle: AppLocalizations.of(context)!
                                  .invalidResetPassToken,
                              buttonLabel:
                                  AppLocalizations.of(context)!.okButton,
                            );
                          }
                          // int statusCode =
                          //     await pv.forgotPassword(email: email);
                          // statusCode == 200
                          //     ? btnStateController.update(ButtonState.success)
                          //     : btnStateController.update(ButtonState.failure);
                        },
                        buttonLabel:
                            AppLocalizations.of(context)!.sendRecoveryMail,
                        borderRadius: context.borderRadius2x,
                      ),
                    ),
                    context.emptySizedHeightBox4x,
                    Center(
                      child: Text(
                        AppLocalizations.of(context)!.receiveCode,
                        style: context.textTheme.subtitle1!
                            .copyWith(fontWeight: context.fw700),
                      ),
                    ),
                    context.emptySizedHeightBox1x,
                    SizedBox(
                      width: context.dynamicWidth(0.5),
                      child: SpecialAsyncButton(
                        bgColor: colors.orangeAccent2,
                        onTap: (btnStateController) async {
                          btnStateController.update(ButtonState.loading);
                          final pv = Provider.of<PasswordViewModel>(context,
                              listen: false);
                          int statusCode =
                              await pv.forgotPassword(email: email);
                          statusCode == 200
                              ? btnStateController.update(ButtonState.success)
                              : btnStateController.update(ButtonState.failure);
                        },
                        buttonLabel:
                            AppLocalizations.of(context)!.resendNewCode,
                        borderRadius: context.borderRadius2x,
                      ),
                    ),
                    context.emptySizedHeightBox3x,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
