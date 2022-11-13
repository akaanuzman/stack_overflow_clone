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
import '../../../viewmodels/answer_view_model.dart';

class EditAnswerView extends StatelessWidget with BaseSingleton {
  final _formKey = GlobalKey<FormState>();

  final Answer answer;
  final String qId;
  EditAnswerView({
    super.key,
    required this.answer,
    required this.qId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeInDown(
          child: Text(AppLocalizations.of(context)!.editAnswer),
        ),
      ),
      body: FadeInUp(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: context.padding2x,
            children: [
              Text(
                AppLocalizations.of(context)!.yourAnswer,
                style: context.textTheme.headline6,
              ),
              context.emptySizedHeightBox3x,
              Container(
                decoration: SpecialContainerDecoration(
                  context: context,
                  color: colors.orange1,
                ),
                padding: context.padding2x,
                child: Text(AppLocalizations.of(context)!.addAnswerInfo),
              ),
              context.emptySizedHeightBox3x,
              Container(
                padding: context.padding2x,
                decoration: SpecialContainerDecoration(context: context),
                child: Column(
                  crossAxisAlignment: context.crossAxisAStart,
                  children: [
                    context.emptySizedHeightBox1x,
                    Text(
                      AppLocalizations.of(context)!.contentTitle,
                      style: context.textTheme.subtitle1!.copyWith(
                        fontWeight: context.fw700,
                      ),
                    ),
                    context.emptySizedHeightBox3x,
                    DefaultTextFormField(
                      context: context,
                      labelText: AppLocalizations.of(context)!.answerLabel,
                      initialValue: answer.content,
                      onChanged: (content) {
                        answer.content = content;
                      },
                      validator: (content) => validators.contentCheck(content),
                    ),
                  ],
                ),
              ),
              context.emptySizedHeightBox3x,
              SpecialAsyncButton(
                onTap: (btnStateController) async {
                  btnStateController.update(ButtonState.loading);
                  _formKey.currentState!.save();
                  if (_formKey.currentState!.validate()) {
                    final pv =
                        Provider.of<AnswerViewModel>(context, listen: false);
                    int statusCode = await pv.editAnswer(
                      qId: qId,
                      aId: "${answer.sId}",
                      content: "${answer.content}",
                    );
                    statusCode == 200
                        ? btnStateController.update(ButtonState.success)
                        : btnStateController.update(ButtonState.failure);
                  } else {
                    btnStateController.update(ButtonState.failure);
                  }
                },
                buttonLabel: AppLocalizations.of(context)!.editYourAnswer,
                borderRadius: context.borderRadius2x,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
