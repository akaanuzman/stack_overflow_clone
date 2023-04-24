import 'package:animate_do/animate_do.dart';
import 'package:async_button/async_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../core/base/base_singleton.dart';
import '../../../../core/extensions/ui_extensions.dart';
import '../../../../features/components/textformfield/default_text_form_field.dart';
import '../../../../uikit/button/special_async_button.dart';
import '../../../../uikit/decoration/special_container_decoration.dart';

import '../../../viewmodels/user_view_model.dart';
import '../../../models/user_model.dart';

class EditProfileView extends StatelessWidget with BaseSingleton {
  final _formKey = GlobalKey<FormState>();

  EditProfileView({super.key});

  Future<void> _editProfile(
    AsyncButtonStateController btnStateController,
    BuildContext context,
    UserViewModel pv,
  ) async {
    btnStateController.update(ButtonState.loading);
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      var user = pv.user;
      Map<String, dynamic> obj = {
        "name": user.name,
        "lastname": user.lastname,
        "title": user.title,
        "place": user.place,
        "website": user.website,
      };
      await pv.updateUser(obj: obj);
      btnStateController.update(ButtonState.success);
    } else {
      btnStateController.update(ButtonState.failure);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body,
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: FadeInDown(
        child: Text(AppLocalizations.of(context)!.editProfile),
      ),
    );
  }

  Consumer<UserViewModel> get _body {
    return Consumer<UserViewModel>(
      builder: (context, pv, _) {
        var user = pv.user;
        return FadeInUp(
          child: Form(
            key: _formKey,
            child: ListView(
              padding: context.padding2x,
              children: [
                _image(context),
                context.emptySizedHeightBox4x,
                _nameField(context, user),
                context.emptySizedHeightBox3x,
                _lastnameField(context, user),
                context.emptySizedHeightBox3x,
                _emailField(context, user),
                context.emptySizedHeightBox3x,
                _descriptionField(context, user),
                context.emptySizedHeightBox3x,
                _placeField(context, user),
                context.emptySizedHeightBox3x,
                _websiteField(context, user),
                context.emptySizedHeightBox3x,
                _editProfileButton(context, pv)
              ],
            ),
          ),
        );
      },
    );
  }

  Container _image(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.1),
      padding: context.padding1x,
      decoration: SpecialContainerDecoration(context: context),
      child: SvgPicture.asset(
        AppLocalizations.of(context)!.iconSvg,
      ),
    );
  }

  DefaultTextFormField _nameField(BuildContext context, UserModel user) {
    return DefaultTextFormField(
      context: context,
      labelText: AppLocalizations.of(context)!.nameLabel,
      prefixIcon: icons.person,
      initialValue: user.name,
      onChanged: (name) {
        user.name = name;
      },
      validator: (name) => globals.validators.nameCheck(name),
    );
  }

  DefaultTextFormField _lastnameField(BuildContext context, UserModel user) {
    return DefaultTextFormField(
      context: context,
      labelText: AppLocalizations.of(context)!.lastnameLabel,
      prefixIcon: icons.person,
      initialValue: user.lastname,
      onChanged: (lastname) {
        user.lastname = lastname;
      },
      validator: (lastname) => globals.validators.lastnameCheck(lastname),
    );
  }

  DefaultTextFormField _emailField(BuildContext context, UserModel user) {
    bool readOnly = true;
    return DefaultTextFormField(
      context: context,
      labelText: AppLocalizations.of(context)!.emailLabel,
      prefixIcon: icons.email,
      initialValue: user.email,
      readOnly: readOnly,
    );
  }

  DefaultTextFormField _descriptionField(BuildContext context, UserModel user) {
    String initialValue = "${user.title}";
    return DefaultTextFormField(
      context: context,
      labelText: AppLocalizations.of(context)!.about,
      prefixIcon: icons.description,
      initialValue: initialValue,
      onChanged: (title) {
        user.title = title;
      },
    );
  }

  DefaultTextFormField _placeField(BuildContext context, UserModel user) {
    String initialValue = "${user.place}";
    return DefaultTextFormField(
      context: context,
      labelText: AppLocalizations.of(context)!.place,
      prefixIcon: icons.place,
      initialValue: initialValue,
      onChanged: (place) {
        user.place = place;
      },
    );
  }

  DefaultTextFormField _websiteField(BuildContext context, UserModel user) {
    String initialValue = "${user.website}";
    return DefaultTextFormField(
      context: context,
      labelText: AppLocalizations.of(context)!.website,
      prefixIcon: icons.language,
      initialValue: initialValue,
      onChanged: (website) {
        user.website = website;
      },
    );
  }

  SpecialAsyncButton _editProfileButton(
      BuildContext context, UserViewModel pv) {
    return SpecialAsyncButton(
      onTap: (btnStateController) async =>
          await _editProfile(btnStateController, context, pv),
      buttonLabel: AppLocalizations.of(context)!.saveProfile,
      borderRadius: context.borderRadius2x,
    );
  }
}
