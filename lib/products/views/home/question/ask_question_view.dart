import 'package:animate_do/animate_do.dart';
import 'package:async_button/async_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/base_singleton.dart';
import '../../../../core/extensions/ui_extensions.dart';
import '../../../../features/components/textformfield/default_text_form_field.dart';
import '../../../../uikit/button/special_async_button.dart';
import '../../../../uikit/decoration/special_container_decoration.dart';
import '../../../viewmodels/question_view_model.dart';

class AskQuestionView extends StatelessWidget with BaseSingleton {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  AskQuestionView({super.key});

  Future<void> _askQuestion(AsyncButtonStateController btnStateController,
      BuildContext context) async {
    btnStateController.update(ButtonState.loading);
    final pv = Provider.of<QuestionViewModel>(context, listen: false);
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
        child: Text(AppLocalizations.of(context)!.askQuestion),
      ),
    );
  }

  FadeInUp _body(BuildContext context) {
    return FadeInUp(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: context.padding2x,
          children: [
            context.emptySizedHeightBox2x,
            _description(context),
            context.emptySizedHeightBox3x,
            _titleSection(context),
            context.emptySizedHeightBox3x,
            _contentSection(context),
            context.emptySizedHeightBox3x,
            _askButton(context),
          ],
        ),
      ),
    );
  }

  Text _description(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.askAPublicQuestion,
      style: context.textTheme.headline6,
    );
  }

  Container _titleSection(BuildContext context) {
    return Container(
      padding: context.padding2x,
      decoration: SpecialContainerDecoration(context: context),
      child: Column(
        crossAxisAlignment: context.crossAxisAStart,
        children: [
          context.emptySizedHeightBox2x,
          _titleTitle(context),
          _titleSubtitle(context),
          context.emptySizedHeightBox2x,
          _titleField(context),
          context.emptySizedHeightBox2x,
        ],
      ),
    );
  }

  Text _titleTitle(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.titleLabel,
      style: context.textTheme.subtitle1!.copyWith(
        fontWeight: context.fw700,
      ),
    );
  }

  Text _titleSubtitle(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.titleDesc,
      style: context.textTheme.subtitle2,
    );
  }

  DefaultTextFormField _titleField(BuildContext context) {
    int minLines = 2;
    int maxLines = 2;
    return DefaultTextFormField(
      context: context,
      labelText: AppLocalizations.of(context)!.titleLabel,
      hintText: AppLocalizations.of(context)!.titleHint,
      controller: _titleController,
      validator: (title) => validators.titleCheck(title),
      minLines: minLines,
      maxLines: maxLines,
    );
  }

  Container _contentSection(BuildContext context) {
    return Container(
      padding: context.padding2x,
      decoration: SpecialContainerDecoration(context: context),
      child: Column(
        crossAxisAlignment: context.crossAxisAStart,
        children: [
          context.emptySizedHeightBox2x,
          _contentTitle(context),
          _contentSubtitle(context),
          context.emptySizedHeightBox2x,
          _contentField(context),
          context.emptySizedHeightBox2x,
        ],
      ),
    );
  }

  Text _contentTitle(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.contentTitle,
      style: context.textTheme.subtitle1!.copyWith(
        fontWeight: context.fw700,
      ),
    );
  }

  Text _contentSubtitle(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.contentDesc,
      style: context.textTheme.subtitle2,
    );
  }

  DefaultTextFormField _contentField(BuildContext context) {
    int minLines = 1;
    int maxLines = 5;
    return DefaultTextFormField(
      context: context,
      labelText: AppLocalizations.of(context)!.contentLabel,
      controller: _contentController,
      validator: (content) => validators.contentCheck(content),
      minLines: minLines,
      maxLines: maxLines,
    );
  }

  SpecialAsyncButton _askButton(BuildContext context) {
    return SpecialAsyncButton(
      borderRadius: context.borderRadius2x,
      onTap: (btnStateController) async =>
          await _askQuestion(btnStateController, context),
      buttonLabel: AppLocalizations.of(context)!.reviewYourQuestion,
    );
  }
}
