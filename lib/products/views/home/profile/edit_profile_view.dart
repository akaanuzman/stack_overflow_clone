import 'package:animate_do/animate_do.dart';
import 'package:async_button/async_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stack_overflow_clone/core/base/base_singleton.dart';
import 'package:stack_overflow_clone/core/extensions/ui_extensions.dart';
import 'package:stack_overflow_clone/products/components/textformfield/default_text_form_field.dart';
import 'package:stack_overflow_clone/uikit/button/special_async_button.dart';
import 'package:stack_overflow_clone/uikit/decoration/special_container_decoration.dart';

import '../../../viewmodels/user_view_model.dart';

class EditProfileView extends StatelessWidget with BaseSingleton {
  final _formKey = GlobalKey<FormState>();

  EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeInDown(
          child: Text(AppLocalizations.of(context)!.editProfile),
        ),
      ),
      body: Consumer<UserViewModel>(
        builder: (context, pv, _) {
          var user = pv.user;
          return FadeInUp(
            child: Form(
              key: _formKey,
              child: ListView(
                padding: context.padding2x,
                children: [
                  Container(
                    height: context.dynamicHeight(0.1),
                    padding: context.padding1x,
                    decoration: SpecialContainerDecoration(context: context),
                    child: SvgPicture.asset(
                      AppLocalizations.of(context)!.iconSvg,
                    ),
                  ),
                  context.emptySizedHeightBox4x,
                  DefaultTextFormField(
                    context: context,
                    labelText: AppLocalizations.of(context)!.nameLabel,
                    prefixIcon: const Icon(Icons.person),
                    initialValue: user.name,
                    onChanged: (name) {
                      user.name = name;
                    },
                    validator: (name) => globals.validators.nameCheck(name),
                  ),
                  context.emptySizedHeightBox3x,
                  DefaultTextFormField(
                    context: context,
                    labelText: AppLocalizations.of(context)!.lastnameLabel,
                    prefixIcon: const Icon(Icons.person),
                    initialValue: user.lastname,
                    onChanged: (lastname) {
                      user.lastname = lastname;
                    },
                    validator: (lastname) =>
                        globals.validators.lastnameCheck(lastname),
                  ),
                  context.emptySizedHeightBox3x,
                  DefaultTextFormField(
                    context: context,
                    labelText: AppLocalizations.of(context)!.emailLabel,
                    prefixIcon: const Icon(Icons.mail),
                    initialValue: user.email,
                    readOnly: true,
                  ),
                  context.emptySizedHeightBox3x,
                  DefaultTextFormField(
                    context: context,
                    labelText: AppLocalizations.of(context)!.about,
                    prefixIcon: const Icon(Icons.description),
                    initialValue: user.title ?? "",
                    onChanged: (title) {
                      user.title = title;
                    },
                  ),
                  context.emptySizedHeightBox3x,
                  DefaultTextFormField(
                    context: context,
                    labelText: AppLocalizations.of(context)!.place,
                    prefixIcon: const Icon(Icons.place),
                    initialValue: user.place ?? "",
                    onChanged: (place) {
                      user.place = place;
                    },
                  ),
                  context.emptySizedHeightBox3x,
                  DefaultTextFormField(
                    context: context,
                    labelText: AppLocalizations.of(context)!.website,
                    prefixIcon: const Icon(Icons.language),
                    initialValue: user.website ?? "",
                    onChanged: (website) {
                      user.website = website;
                    },
                  ),
                  context.emptySizedHeightBox3x,
                  SpecialAsyncButton(
                    onTap: (btnStateController) async {
                      btnStateController.update(ButtonState.loading);
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        await pv.updateUser;
                        btnStateController.update(ButtonState.success);
                      } else {
                        btnStateController.update(ButtonState.failure);
                      }
                    },
                    buttonLabel: AppLocalizations.of(context)!.saveProfile,
                    borderRadius: context.borderRadius2x,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
