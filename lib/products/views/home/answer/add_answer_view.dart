import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/base_singleton.dart';
import '../../../../core/extensions/ui_extensions.dart';
import '../../../../uikit/button/special_button.dart';
import '../../../../uikit/decoration/special_container_decoration.dart';
import '../../../components/textformfield/default_text_form_field.dart';
import '../../../viewmodels/answer_view_model.dart';

class AddAnswerView extends StatelessWidget with BaseSingleton {
  final String questionId;
  final _contentController = TextEditingController();
  AddAnswerView({
    super.key,
    required this.questionId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeInDown(
          child: Text(AppLocalizations.of(context)!.addAnswer),
        ),
      ),
      body: FadeInUp(
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
                    controller: _contentController,
                  ),
                ],
              ),
            ),
            context.emptySizedHeightBox3x,
            SpecialButton(
              onTap: () async {
                final pv = Provider.of<AnswerViewModel>(context, listen: false);
                await pv.addAnswer(
                  qId: questionId,
                  content: _contentController.text,
                );
              },
              buttonLabel: AppLocalizations.of(context)!.postYourAnswer,
              borderRadius: context.borderRadius2x,
            )
          ],
        ),
      ),
    );
  }
}
