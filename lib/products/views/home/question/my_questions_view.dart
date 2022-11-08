// ignore_for_file: use_build_context_synchronously

import 'package:animate_do/animate_do.dart';
import 'package:async_button/async_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../../core/base/base_singleton.dart';
import '../../../../core/enums/alert_enum.dart';
import '../../../../core/extensions/ui_extensions.dart';

import '../../../../uikit/button/special_button.dart';
import '../../../../uikit/decoration/special_container_decoration.dart';
import '../../../components/textformfield/default_text_form_field.dart';
import '../../../models/user_model.dart';
import '../../../viewmodels/question_view_model.dart';
import '../../../viewmodels/user_view_model.dart';
import '../answer/question_detail_view.dart';
import 'ask_question_view.dart';
import 'edit_question_view.dart';

class MyQuestionsView extends StatelessWidget with BaseSingleton {
  final _questionController = TextEditingController();

  MyQuestionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeInDown(
          child: Row(
            mainAxisAlignment: context.mainAxisASpaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.myQuestions),
              SpecialButton(
                buttonLabel: AppLocalizations.of(context)!.askQuestion,
                borderRadius: context.borderRadius2x,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AskQuestionView(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Consumer<UserViewModel>(
        builder: (context, pv, _) {
          var questionLength = pv.user.question?.length ?? 0;
          return FadeInUp(
            child: ListView(
              children: [
                questionLength == 0
                    ? Center(
                        child: Container(
                          margin: context.padding2x,
                          padding: context.padding4x,
                          decoration:
                              SpecialContainerDecoration(context: context),
                          alignment: context.alignmentCenter,
                          child: Text(
                            AppLocalizations.of(context)!.emptyQuestion,
                            style: context.textTheme.headline6,
                            textAlign: context.taCenter,
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: context.padding2x,
                            child: DefaultTextFormField(
                              context: context,
                              labelText:
                                  AppLocalizations.of(context)!.searchLabel,
                              prefixIcon: const Icon(Icons.search),
                              filled: true,
                              fillColor: colors.white,
                              controller: _questionController,
                              onChanged: pv.searchQuestion,
                            ),
                          ),
                          _questionsList(context, pv, questionLength),
                        ],
                      ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _questionsList(
      BuildContext context, UserViewModel pv, int questionLength) {
    if (_questionController.text.isNotEmpty) {
      questionLength = pv.questionSearchList.length;
    }
    return Container(
      padding: context.padding1x,
      color: colors.yellow1.withOpacity(0.65),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var item = Question();
          if (pv.user.question != null) {
            item = pv.user.question![index];
          }
          if (_questionController.text.isNotEmpty) {
            item = pv.questionSearchList[index];
          }
          return _question(context, item);
        },
        separatorBuilder: (context, index) {
          return uiGlobals.divider;
        },
        itemCount: questionLength,
      ),
    );
  }

  Widget _question(BuildContext context, Question item) {
    return FadeInUp(
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionDetailView(
              id: "${item.sId}",
            ),
          ),
        ),
        child: Column(
          children: [
            _questionPropertiesAndTitle(context, item),
            context.emptySizedHeightBox1x,
          ],
        ),
      ),
    );
  }

  Widget _questionPropertiesAndTitle(BuildContext context, Question item) {
    return ListTile(
      title: _questionProperties(context, item),
      subtitle: _questionTitle(context, item),
      trailing: _editAndRemoveButtons(context, item),
    );
  }

  Text _questionProperties(BuildContext context, Question item) {
    String like = "${item.fav?.length}";
    String answers = "${item.answer?.length}";
    return Text(
      "$like likes $answers answers",
      style: context.textTheme.subtitle2,
    );
  }

  Widget _questionTitle(BuildContext context, Question item) {
    return Text(
      item.title ?? "",
      style: context.textTheme.subtitle1!.copyWith(
        fontWeight: context.fw600,
        color: colors.blue6,
      ),
    );
  }

  Wrap _editAndRemoveButtons(BuildContext context, Question item) {
    return Wrap(
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditQuestionView(
                  question: item,
                ),
              ),
            );
          },
          icon: Icon(
            Icons.edit,
            color: colors.blueAccent,
          ),
        ),
        IconButton(
          onPressed: () {
            uiGlobals.showAlertDialog(
              context: context,
              alertEnum: AlertEnum.AREUSURE,
              contentTitle: AppLocalizations.of(context)!.areYouSure,
              contentSubtitle:
                  AppLocalizations.of(context)!.deleteQuestionContent,
              buttonLabel: AppLocalizations.of(context)!.okButton,
              onTap: (btnStateController) async {
                btnStateController.update(ButtonState.loading);
                final pv =
                    Provider.of<QuestionViewModel>(context, listen: false);
                int statusCode =
                    await pv.deleteQuestion(id: "${item.sId}").then((value) {
                  Navigator.pop(context);
                  return 200;
                });
                statusCode == 200
                    ? btnStateController.update(ButtonState.success)
                    : btnStateController.update(ButtonState.failure);
              },
              secondButtonLabel: AppLocalizations.of(context)!.cancelButton,
            );
          },
          icon: Icon(
            Icons.delete,
            color: colors.redAccent,
          ),
        ),
      ],
    );
  }
}
