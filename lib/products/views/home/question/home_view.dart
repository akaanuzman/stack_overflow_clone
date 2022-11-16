import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../uikit/decoration/special_container_decoration.dart';
import '../../../../core/base/base_singleton.dart';
import '../../../../features/components/textformfield/default_text_form_field.dart';
import '../../../../core/extensions/ui_extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../uikit/button/special_button.dart';
import '../../../models/question_model.dart';
import '../../../viewmodels/question_view_model.dart';
import 'ask_question_view.dart';
import '../answer/question_detail_view.dart';

class HomeView extends StatelessWidget with BaseSingleton {
  final _questionController = TextEditingController();
  HomeView({super.key});

  void _goToaskQuestionView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AskQuestionView(),
      ),
    );
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
        child: Row(
          mainAxisAlignment: context.mainAxisASpaceBetween,
          children: [
            _appBartitle(context),
            _appBarAction(context),
          ],
        ),
      ),
    );
  }

  Text _appBartitle(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.questionsTitle,
      style: context.textTheme.headline6,
    );
  }

  Widget _appBarAction(BuildContext context) {
    return SpecialButton(
      buttonLabel: AppLocalizations.of(context)!.askQuestion,
      borderRadius: context.borderRadius2x,
      onTap: () => _goToaskQuestionView(context),
    );
  }

  FadeInUp _body(BuildContext context) {
    return FadeInUp(
      child: Consumer<QuestionViewModel>(
        builder: (BuildContext context, QuestionViewModel pv, _) {
          int questionLength = pv.questions.length;
          bool shrinkWrap = questionLength == 0 ? true : false;
          List<Widget> children = [
            questionLength == 0
                ? Center(
                    child: _noQuestionSection(context),
                  )
                : Column(
                    children: [
                      _searchField(context, pv),
                      _questionListContainer(context, pv),
                    ],
                  ),
          ];
          return Center(
            child: ListView(
              shrinkWrap: shrinkWrap,
              children: children,
            ),
          );
        },
      ),
    );
  }

  Container _noQuestionSection(BuildContext context) {
    return Container(
      margin: context.padding2x,
      padding: context.padding4x,
      decoration: SpecialContainerDecoration(context: context),
      alignment: context.alignmentCenter,
      child: Text(
        AppLocalizations.of(context)!.emptyQuestion,
        style: context.textTheme.headline6,
        textAlign: context.taCenter,
      ),
    );
  }

  Padding _searchField(BuildContext context, QuestionViewModel pv) {
    bool filled = true;
    return Padding(
      padding: context.padding2x,
      child: DefaultTextFormField(
        context: context,
        labelText: AppLocalizations.of(context)!.searchLabel,
        prefixIcon: icons.search,
        filled: filled,
        fillColor: colors.white,
        controller: _questionController,
        onChanged: pv.searchQuestion,
      ),
    );
  }

  FadeInUp _questionListContainer(BuildContext context, QuestionViewModel pv) {
    return FadeInUp(
      child: Container(
        padding: context.padding1x,
        color: colors.yellow1.withOpacity(0.65),
        child: _questionList(pv),
      ),
    );
  }

  Widget _questionList(QuestionViewModel pv) {
    bool shrinkWrap = true;
    int count = pv.questions.length;
    if (_questionController.text.isNotEmpty) {
      count = pv.searchList.length;
    }
    return ListView.separated(
      shrinkWrap: shrinkWrap,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: count,
      separatorBuilder: (BuildContext context, int index) {
        return uiGlobals.divider;
      },
      itemBuilder: (BuildContext context, int index) {
        var item = pv.questions[index];
        if (_questionController.text.isNotEmpty) {
          item = pv.searchList[index];
        }
        return _question(context, item);
      },
    );
  }

  Widget _question(BuildContext context, QuestionModel item) {
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
            _questionInformation(context, item)
          ],
        ),
      ),
    );
  }

  ListTile _questionPropertiesAndTitle(
      BuildContext context, QuestionModel item) {
    return ListTile(
      title: _questionProperties(context, item),
      subtitle: _questionTitle(context, item),
    );
  }

  Text _questionProperties(BuildContext context, QuestionModel item) {
    String like = "${item.fav?.length}";
    String answers = "${item.answer?.length}";
    String title = "$like likes $answers answers";
    return Text(
      title,
      style: context.textTheme.subtitle2,
    );
  }

  Text _questionTitle(BuildContext context, QuestionModel item) {
    String questionTitle = item.title ?? "";
    return Text(
      questionTitle,
      style: context.textTheme.subtitle1!.copyWith(
        fontWeight: context.fw600,
        color: colors.blue6,
      ),
    );
  }

  Row _questionInformation(BuildContext context, QuestionModel item) {
    String username = "${item.user?.name} ${item.user?.lastname}";
    String time = globals.formatDate("${item.createdAt}");
    String usernameText = "$username ";
    String createdTime = " $time created ";
    return Row(
      mainAxisAlignment: context.mainAxisAEnd,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: usernameText,
                style:
                    context.textTheme.subtitle2!.copyWith(color: colors.blue6),
              ),
              TextSpan(
                text: createdTime,
                style: context.textTheme.subtitle2!.copyWith(
                  color: colors.black45,
                  fontWeight: context.fw500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
