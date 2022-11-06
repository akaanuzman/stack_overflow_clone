import 'package:animate_do/animate_do.dart';
import 'package:async_button/async_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../../uikit/button/special_async_button.dart';

import '../../../../core/base/base_singleton.dart';
import '../../../../core/extensions/ui_extensions.dart';
import '../../../../uikit/decoration/special_container_decoration.dart';
import '../../../components/textformfield/default_text_form_field.dart';
import '../../../viewmodels/question_view_model.dart';

class AskQuestionView extends StatelessWidget with BaseSingleton {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  AskQuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeInDown(
          child: Text(AppLocalizations.of(context)!.askQuestion),
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
                AppLocalizations.of(context)!.askAPublicQuestion,
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
                      controller: _titleController,
                      validator: (title) => validators.titleCheck(title),
                      minLines: 2,
                      maxLines: 2,
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
                      controller: _contentController,
                      validator: (content) => validators.contentCheck(content),
                      minLines: 1,
                      maxLines: 5,
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
                  final pv =
                      Provider.of<QuestionViewModel>(context, listen: false);
                  _formKey.currentState!.save();
                  if (_formKey.currentState!.validate()) {
                    await pv.addNewQuestion(
                      title: _titleController.text,
                      content: _contentController.text,
                    );
                    btnStateController.update(ButtonState.success);
                  } else {
                    btnStateController.update(ButtonState.failure);
                  }
                },
                buttonLabel: AppLocalizations.of(context)!.reviewYourQuestion,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
