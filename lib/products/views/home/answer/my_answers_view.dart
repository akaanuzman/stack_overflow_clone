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
import '../../../../features/components/textformfield/default_text_form_field.dart';
import '../../../viewmodels/user_view_model.dart';
import 'edit_answer_view.dart';
import 'question_detail_view.dart';

class MyAnswersView extends StatelessWidget with BaseSingleton {
  final _answerController = TextEditingController();

  MyAnswersView({super.key});

  void _goToQuestionDetail(BuildContext context, Answer item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          String id = "${item.question}";
          return QuestionDetailView(
            id: id,
          );
        },
      ),
    );
  }

  void _goToEditAnswer(BuildContext context, Answer item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          String qId = "${item.question}";
          return EditAnswerView(
            answer: item,
            qId: qId,
          );
        },
      ),
    );
  }

  Future<void> _deleteAnswer(BuildContext context, Answer item) async {
    uiGlobals.showAlertDialog(
      context: context,
      alertEnum: AlertEnum.AREUSURE,
      contentTitle: AppLocalizations.of(context)!.areYouSure,
      contentSubtitle: AppLocalizations.of(context)!.deleteAnswerContent,
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
        child: Text(AppLocalizations.of(context)!.myAnswers),
      ),
    );
  }

  Consumer<UserViewModel> get _body {
    return Consumer<UserViewModel>(
      builder: (context, pv, _) {
        var answerLength = pv.user.answer?.length ?? 0;
        List<Widget> children = [
          answerLength == 0
              ? _noAnswer(context)
              : Column(
                  children: [
                    _searchField(context, pv),
                    _answerList(context, pv, answerLength),
                  ],
                ),
        ];
        return FadeInUp(
          child: ListView(
            children: children,
          ),
        );
      },
    );
  }

  Center _noAnswer(BuildContext context) {
    return Center(
      child: Container(
        margin: context.padding2x,
        padding: context.padding4x,
        decoration: SpecialContainerDecoration(context: context),
        alignment: context.alignmentCenter,
        child: Text(
          AppLocalizations.of(context)!.emptyQuestion,
          style: context.textTheme.headline6,
          textAlign: context.taCenter,
        ),
      ),
    );
  }

  Padding _searchField(BuildContext context, UserViewModel pv) {
    bool filled = true;
    return Padding(
      padding: context.padding2x,
      child: DefaultTextFormField(
        context: context,
        labelText: AppLocalizations.of(context)!.searchLabel,
        prefixIcon: icons.search,
        filled: filled,
        fillColor: colors.white,
        controller: _answerController,
        onChanged: pv.searchQuestion,
      ),
    );
  }

  Widget _answerList(BuildContext context, UserViewModel pv, int answerLength) {
    bool shrinkWrap = true;
    if (_answerController.text.isNotEmpty) {
      answerLength = pv.answerSearchList.length;
    }
    return Container(
      padding: context.padding1x,
      color: colors.yellow1.withOpacity(0.65),
      child: ListView.separated(
        shrinkWrap: shrinkWrap,
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
        onTap: () => _goToQuestionDetail(context, item),
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
    String title = "$like likes $createdAt created at";
    return Text(
      title,
      style: context.textTheme.subtitle2,
    );
  }

  Widget _answerTitle(BuildContext context, Answer item) {
    String answerTitle = item.content ?? "";
    return Text(
      answerTitle,
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
          onPressed: () => _goToEditAnswer(context, item),
          icon: Icon(
            Icons.edit,
            color: colors.blueAccent,
          ),
        ),
        IconButton(
          onPressed: () async => _deleteAnswer(context, item),
          icon: Icon(
            Icons.delete,
            color: colors.redAccent,
          ),
        ),
      ],
    );
  }
}
