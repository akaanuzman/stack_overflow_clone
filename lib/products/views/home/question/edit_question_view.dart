import 'package:animate_do/animate_do.dart';
import 'package:async_button/async_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../../core/base/base_singleton.dart';
import '../../../../core/extensions/ui_extensions.dart';
import '../../../models/user_model.dart';

import '../../../../uikit/button/special_async_button.dart';
import '../../../../uikit/decoration/special_container_decoration.dart';
import '../../../components/textformfield/default_text_form_field.dart';
import '../../../viewmodels/question_view_model.dart';

class EditQuestionView extends StatelessWidget with BaseSingleton {
  final Question question;
  final _formKey = GlobalKey<FormState>();

  EditQuestionView({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeInDown(
          child: Text(AppLocalizations.of(context)!.editQuestion),
        ),
      ),
      body: FadeInUp(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: context.padding2x,
            children: [
              context.emptySizedHeightBox2x,
              Text(
                AppLocalizations.of(context)!.editQuestion,
                style: context.textTheme.headline6,
              ),
              context.emptySizedHeightBox3x,
              Container(
                padding: context.padding2x,
                decoration: SpecialContainerDecoration(context: context),
                child: Column(
                  crossAxisAlignment: context.crossAxisAStart,
                  children: [
                    context.emptySizedHeightBox2x,
                    Text(
                      AppLocalizations.of(context)!.titleLabel,
                      style: context.textTheme.subtitle1!.copyWith(
                        fontWeight: context.fw700,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.titleDesc,
                      style: context.textTheme.subtitle2,
                    ),
                    context.emptySizedHeightBox2x,
                    DefaultTextFormField(
                      context: context,
                      labelText: AppLocalizations.of(context)!.titleLabel,
                      hintText: AppLocalizations.of(context)!.titleHint,
                      validator: (title) => validators.titleCheck(title),
                      minLines: 2,
                      maxLines: 2,
                      initialValue: question.title,
                      onChanged: (title) {
                        question.title = title;
                      },
                    ),
                    context.emptySizedHeightBox2x,
                  ],
                ),
              ),
              context.emptySizedHeightBox3x,
              Container(
                padding: context.padding2x,
                decoration: SpecialContainerDecoration(context: context),
                child: Column(
                  crossAxisAlignment: context.crossAxisAStart,
                  children: [
                    context.emptySizedHeightBox2x,
                    Text(
                      AppLocalizations.of(context)!.contentTitle,
                      style: context.textTheme.subtitle1!.copyWith(
                        fontWeight: context.fw700,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.contentDesc,
                      style: context.textTheme.subtitle2,
                    ),
                    context.emptySizedHeightBox2x,
                    DefaultTextFormField(
                      context: context,
                      labelText: AppLocalizations.of(context)!.contentLabel,
                      validator: (content) => validators.contentCheck(content),
                      minLines: 1,
                      maxLines: 5,
                      initialValue: question.subtitle,
                      onChanged: (subtitle) {
                        question.subtitle = subtitle;
                      },
                    ),
                    context.emptySizedHeightBox2x,
                  ],
                ),
              ),
              context.emptySizedHeightBox3x,
              SpecialAsyncButton(
                borderRadius: context.borderRadius2x,
                onTap: (btnStateController) async {
                  btnStateController.update(ButtonState.loading);

                  _formKey.currentState!.save();
                  if (_formKey.currentState!.validate()) {
                    final pv =
                        Provider.of<QuestionViewModel>(context, listen: false);
                    int statusCode = await pv.updateQuestion(
                      title: "${question.title}",
                      subtitle: "${question.subtitle}",
                      id: "${question.sId}",
                    );
                    statusCode == 200
                        ? btnStateController.update(ButtonState.success)
                        : btnStateController.update(ButtonState.failure);
                  } else {
                    btnStateController.update(ButtonState.failure);
                  }
                },
                buttonLabel: AppLocalizations.of(context)!.saveEdit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
