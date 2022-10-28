import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/base/base_singleton.dart';
import '../../components/textformfield/default_text_form_field.dart';
import '../../../core/extensions/ui_extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../uikit/button/special_button.dart';
import '../../models/question_model.dart';
import '../../viewmodels/question_view_model.dart';
import 'ask_question_view.dart';
import 'question_detail_view.dart';

class HomeView extends StatelessWidget with BaseSingleton {
  final _questionController = TextEditingController();
  HomeView({super.key});

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
            _title(context),
            _askQuestionButton(context),
          ],
        ),
      ),
    );
  }

  Text _title(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.questionsTitle,
      style: context.textTheme.headline6,
    );
  }

  Widget _askQuestionButton(BuildContext context) {
    return SpecialButton(
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
    );
  }

  FadeInUp _body(BuildContext context) {
    return FadeInUp(
      child: Consumer<QuestionViewModel>(
        builder: (BuildContext context, QuestionViewModel pv, _) {
          return ListView(
            children: [
              Padding(
                padding: context.padding2x,
                child: DefaultTextFormField(
                  context: context,
                  labelText: AppLocalizations.of(context)!.searchLabel,
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: colors.white,
                  controller: _questionController,
                  onChanged: pv.searchQuestion,
                ),
              ),
              Container(
                padding: context.padding1x,
                color: colors.yellow1.withOpacity(0.65),
                child: _questionList(pv),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _questionList(QuestionViewModel pv) {
    int count = pv.questions.length;
    if (_questionController.text.isNotEmpty) {
      count = pv.searchList.length;
    }
    return ListView.separated(
      shrinkWrap: true,
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
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const QuestionDetailView(),
        ),
      ),
      child: Column(
        children: [
          _questionPropertiesAndTitle(context, item),
          context.emptySizedHeightBox1x,
          _questionInformation(context, item)
        ],
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
    return Text(
      "$like likes $answers answers",
      style: context.textTheme.subtitle2,
    );
  }

  Text _questionTitle(BuildContext context, QuestionModel item) {
    return Text(
      item.title ?? "",
      style: context.textTheme.subtitle1!.copyWith(
        fontWeight: context.fw600,
        color: colors.blue6,
      ),
    );
  }

  Row _questionInformation(BuildContext context, QuestionModel item) {
    String username = "${item.user?.name} ${item.user?.lastname}";
    String time = globals.formatDate("${item.createdAt}");
    String asked = "${item.user?.question?.length}";
    return Row(
      mainAxisAlignment: context.mainAxisAEnd,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "$username ",
                style:
                    context.textTheme.subtitle2!.copyWith(color: colors.blue6),
              ),
              TextSpan(
                text: "$asked asked ",
                style: context.textTheme.subtitle2!.copyWith(
                  color: colors.black54,
                  fontWeight: context.fw700,
                ),
              ),
              TextSpan(
                text: " $time created ",
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
