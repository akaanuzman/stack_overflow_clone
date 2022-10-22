import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stack_overflow_clone/core/base/base_singleton.dart';
import 'package:stack_overflow_clone/core/extensions/ui_extensions.dart';
import 'package:stack_overflow_clone/uikit/button/special_button.dart';
import 'package:stack_overflow_clone/uikit/decoration/special_container_decoration.dart';
import 'package:stack_overflow_clone/uikit/textformfield/special_text_form_field.dart';

// TODO: ADD LANG, MAKE CLEAN CODE THIS FILE
class LoginView extends StatelessWidget with BaseSingleton {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: context.padding6x,
          children: [
            FadeInDown(
              child: SvgPicture.asset("assets/images/logo.svg"),
            ),
            FadeInUp(
              child: Container(
                decoration: SpecialContainerDecoration(context: context),
                padding: context.padding4x,
                margin: context.paddingVertical2x,
                child: Column(
                  children: [
                    SpecialTextFormField(
                      prefixIcon: const Icon(Icons.email),
                      context: context,
                      labelText: "Email",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: colors.grey),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    context.emptySizedHeightBox3x,
                    SpecialTextFormField(
                      prefixIcon: const Icon(Icons.lock),
                      context: context,
                      labelText: "Password",
                      obscureText: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: colors.grey),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    context.emptySizedHeightBox3x,
                    SizedBox(
                      width: double.maxFinite,
                      child: SpecialButton(
                        buttonLabel: "Log in",
                        borderRadius: context.borderRadius2x,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot password?",
                          style: context.textTheme.caption!.copyWith(
                            color: colors.blue6,
                            fontWeight: context.fw700,
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1.5,
                    ),
                    Wrap(
                      // TODO: ADD CORE WRAPCROSSALIGNMENT
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: context.textTheme.subtitle2!.copyWith(),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Sign up",
                            style: context.textTheme.subtitle2!.copyWith(
                              color: colors.blue6,
                              fontWeight: context.fw600,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
