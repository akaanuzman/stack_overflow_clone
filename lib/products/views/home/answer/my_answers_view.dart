import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../../core/base/base_singleton.dart';
import '../../../../core/extensions/ui_extensions.dart';
import '../../../models/user_model.dart';
import '../../../viewmodels/answer_view_model.dart';
import '../../../../core/enums/alert_enum.dart';
import '../../../../uikit/decoration/special_container_decoration.dart';
import '../../../components/textformfield/default_text_form_field.dart';
import '../../../viewmodels/user_view_model.dart';
import 'edit_answer_view.dart';
import 'question_detail_view.dart';

class MyAnswersView extends StatelessWidget with BaseSingleton {
  final _answerController = TextEditingController();

  MyAnswersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeInDown(
          child: Text(AppLocalizations.of(context)!.myAnswers),
        ),
      ),
      body: Consumer<UserViewModel>(
        builder: (context, pv, _) {
          var answerLength = pv.user.answer?.length ?? 0;
          return FadeInUp(
            child: ListView(
              children: [
                answerLength == 0
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
                              controller: _answerController,
                              onChanged: pv.searchQuestion,
                            ),
                          ),
                          _answerList(context, pv, answerLength),
                        ],
                      ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _answerList(BuildContext context, UserViewModel pv, int answerLength) {
    if (_answerController.text.isNotEmpty) {
      answerLength = pv.answerSearchList.length;
    }
    return Container(
      padding: context.padding1x,
      color: colors.yellow1.withOpacity(0.65),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var item = Answer();
          if (pv.user.answer != null) {
            item = pv.user.answer![index];
          }
          if (_answerController.text.isNotEmpty) {
            item = pv.answerSearchList[index];
          }
          return _answer(context, item);
        },
        separatorBuilder: (context, index) {
          return uiGlobals.divider;
        },
        itemCount: answerLength,
      ),
    );
  }

  Widget _answer(BuildContext context, Answer item) {
    return FadeInUp(
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionDetailView(
              id: "${item.question}",
            ),
          ),
        ),
        child: Column(
          children: [
            _answerPropertiesAndTitle(context, item),
            context.emptySizedHeightBox1x,
          ],
        ),
      ),
    );
  }

  Widget _answerPropertiesAndTitle(BuildContext context, Answer item) {
    return ListTile(
      title: _answerProperties(context, item),
      subtitle: _answerTitle(context, item),
      trailing: _editAndRemoveButtons(context, item),
    );
  }

  Text _answerProperties(BuildContext context, Answer item) {
    String like = "${item.fav?.length}";
    String createdAt = "${globals.formatDate(item.createdAt)}";
    return Text(
      "$like likes $createdAt created at",
      style: context.textTheme.subtitle2,
    );
  }

  Widget _answerTitle(BuildContext context, Answer item) {
    return Text(
      item.content ?? "",
      style: context.textTheme.subtitle1!.copyWith(
        fontWeight: context.fw600,
        color: colors.blue6,
      ),
    );
  }

  Wrap _editAndRemoveButtons(BuildContext context, Answer item) {
    return Wrap(
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditAnswerView(
                  answer: item,
                  qId: "${item.question}",
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
                  AppLocalizations.of(context)!.deleteAnswerContent,
              buttonLabel: AppLocalizations.of(context)!.okButton,
              onTap: () async {
                final pv = Provider.of<AnswerViewModel>(context, listen: false);
                await pv
                    .deleteAnswer(
                  qId: "${item.question}",
                  aId: "${item.sId}",
                )
                    .then((value) {
                  Navigator.pop(context);
                });
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
