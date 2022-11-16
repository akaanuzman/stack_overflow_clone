import 'package:animate_do/animate_do.dart';
import 'package:async_button/async_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../../uikit/button/special_async_button.dart';

import '../../../../core/base/base_singleton.dart';
import '../../../../core/extensions/ui_extensions.dart';
import '../../../../uikit/decoration/special_container_decoration.dart';
import '../../../../features/components/textformfield/default_text_form_field.dart';
import '../../../viewmodels/answer_view_model.dart';

class AddAnswerView extends StatelessWidget with BaseSingleton {
  final String questionId;
  final _contentController = TextEditingController();
  AddAnswerView({
    super.key,
    required this.questionId,
  });

  Future<void> _addAnswerOP(AsyncButtonStateController btnStateController,
      BuildContext context) async {
    btnStateController.update(ButtonState.loading);
    final pv = Provider.of<AnswerViewModel>(context, listen: false);
    int statusCode = await pv.addAnswer(
      qId: questionId,
      content: _contentController.text,
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
        child: Text(AppLocalizations.of(context)!.addAnswer),
      ),
    );
  }

  FadeInUp _body(BuildContext context) {
    return FadeInUp(
      child: ListView(
        padding: context.padding2x,
        children: [
          _title(context),
          context.emptySizedHeightBox3x,
          _answerDescription(context),
          context.emptySizedHeightBox3x,
          _answerSection(context),
          context.emptySizedHeightBox3x,
          _addAnswer(context),
        ],
      ),
    );
  }

  Text _title(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.yourAnswer,
      style: context.textTheme.headline6,
    );
  }

  Container _answerDescription(BuildContext context) {
    return Container(
      decoration: SpecialContainerDecoration(
        context: context,
        color: colors.orange1,
      ),
      padding: context.padding2x,
      child: Text(AppLocalizations.of(context)!.addAnswerInfo),
    );
  }

  Container _answerSection(BuildContext context) {
    return Container(
      padding: context.padding2x,
      decoration: SpecialContainerDecoration(context: context),
      child: Column(
        crossAxisAlignment: context.crossAxisAStart,
        children: [
          context.emptySizedHeightBox1x,
          _answerTitle(context),
          context.emptySizedHeightBox3x,
          _answerField(context),
        ],
      ),
    );
  }

  Text _answerTitle(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.contentTitle,
      style: context.textTheme.subtitle1!.copyWith(
        fontWeight: context.fw700,
      ),
    );
  }

  DefaultTextFormField _answerField(BuildContext context) {
    return DefaultTextFormField(
      context: context,
      labelText: AppLocalizations.of(context)!.answerLabel,
      controller: _contentController,
    );
  }

  SpecialAsyncButton _addAnswer(BuildContext context) {
    return SpecialAsyncButton(
      onTap: (btnStateController) async =>
          await _addAnswerOP(btnStateController, context),
      buttonLabel: AppLocalizations.of(context)!.postYourAnswer,
      borderRadius: context.borderRadius2x,
    );
  }
}
