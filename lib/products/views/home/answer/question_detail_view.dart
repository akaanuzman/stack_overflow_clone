// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:stack_overflow_clone/features/components/container/question_or_answer_section.dart';
import 'package:stack_overflow_clone/features/components/row/like_and_user_info.dart';

import '../../../../core/base/base_singleton.dart';
import '../../../../core/extensions/ui_extensions.dart';
import '../../../../uikit/button/special_button.dart';
import '../../../../uikit/decoration/special_container_decoration.dart';
import '../../../../uikit/skeleton/skeleton_list.dart';
import '../../../viewmodels/answer_view_model.dart';
import '../../../viewmodels/question_view_model.dart';
import 'add_answer_view.dart';
import 'package:stack_overflow_clone/products/models/answer_model.dart';
import 'package:stack_overflow_clone/products/models/question_model.dart';

class QuestionDetailView extends StatelessWidget with BaseSingleton {
  final String id;
  const QuestionDetailView({
    super.key,
    required this.id,
  });

  void _goToAddAnswer(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddAnswerView(
          questionId: id,
        ),
      ),
    );
  }

  Future<void> getQuestionAndAnswers(BuildContext context) async {
    final qpv = Provider.of<QuestionViewModel>(context, listen: false);
    final apv = Provider.of<AnswerViewModel>(context, listen: false);
    await Future.wait(
      [
        qpv.getQuestionById(id: id),
        apv.getAllAnswers(qId: id),
      ],
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
            _appBarTitle(context),
            _appBarAction(context),
          ],
        ),
      ),
    );
  }

  Text _appBarTitle(BuildContext context) =>
      Text(AppLocalizations.of(context)!.questionDetail);

  SpecialButton _appBarAction(BuildContext context) {
    return SpecialButton(
      buttonLabel: AppLocalizations.of(context)!.addAnswer,
      borderRadius: context.borderRadius2x,
      onTap: () => _goToAddAnswer(context),
    );
  }

  FutureBuilder<void> _body(BuildContext context) {
    return FutureBuilder(
      future: getQuestionAndAnswers(context),
      builder: (_, snapShot) {
        switch (snapShot.connectionState) {
          case ConnectionState.waiting:
            return SkeletonList();
          default:
            return _connectionStateDone;
        }
      },
    );
  }

  FadeInUp get _connectionStateDone {
    return FadeInUp(
      child: Consumer<QuestionViewModel>(
        builder: (context, pv, _) {
          final question = pv.question;
          return _questionAndAnswerSection(context, question, pv);
        },
      ),
    );
  }

  ListView _questionAndAnswerSection(
      BuildContext context, QuestionModel question, QuestionViewModel pv) {
    String title = "${question.title}";
    return ListView(
      padding: context.padding2x,
      children: [
        Text(
          title,
          style: context.textTheme.headline6,
        ),
        context.emptySizedHeightBox1x,
        _questionDateSection(context, question),
        context.emptySizedHeightBox2x,
        uiGlobals.divider,
        context.emptySizedHeightBox2x,
        QuestionOrAnswerSection(content: "${question.subtitle}"),
        context.emptySizedHeightBox3x,
        _questionLikeAndUserInfo(pv, question, context),
        context.emptySizedHeightBox5x,
        _answerSection,
      ],
    );
  }

  Row _questionDateSection(BuildContext context, QuestionModel question) {
    return Row(
      children: [
        _questionDateInfo(context, "${question.createdAt}"),
        context.emptySizedWidthBox2x,
        _questionDateInfo(context, "${question.modifiedAt}")
      ],
    );
  }

  Row _questionDateInfo(BuildContext context, String date) {
    return Row(
      children: [
        Text(
          AppLocalizations.of(context)!.modified,
          style: context.textTheme.subtitle2!.copyWith(color: colors.black54),
        ),
        context.emptySizedWidthBox1x,
        Text(
          globals.formatDate(date),
          style: context.textTheme.subtitle2,
        ),
      ],
    );
  }

  LikeAndUserInfo _questionLikeAndUserInfo(
    QuestionViewModel pv,
    QuestionModel question,
    BuildContext context,
  ) {
    String favLength = "${question.fav?.length}";
    String createdAt = "asked ${globals.formatDate(question.createdAt)}";
    String username = "${question.user?.name} ${question.user?.lastname}";
    return LikeAndUserInfo(
      onPressed: () async {
        await pv.questionFavOperation(
          model: question,
          id: id,
        );
      },
      likeColor: pv.isFavQuestion(question, context),
      favLength: favLength,
      createdAt: createdAt,
      username: username,
    );
  }

  Consumer<AnswerViewModel> get _answerSection {
    return Consumer<AnswerViewModel>(
      builder: (context, apv, _) {
        var answerLength = apv.answers.length;
        return answerLength == 0
            ? _noAnswer(context)
            : _answers(context, answerLength, apv);
      },
    );
  }

  Container _noAnswer(BuildContext context) {
    return Container(
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

  Column _answers(BuildContext context, int answerLength, AnswerViewModel apv) {
    return Column(
      crossAxisAlignment: context.crossAxisAStart,
      children: [
        _answerLength(answerLength, context),
        context.emptySizedHeightBox2x,
        uiGlobals.divider,
        context.emptySizedHeightBox2x,
        _answerList(apv),
      ],
    );
  }

  Text _answerLength(int answerLength, BuildContext context) {
    String length = "$answerLength Answers";
    return Text(
      length,
      style: context.textTheme.headline6,
    );
  }

  ListView _answerList(AnswerViewModel apv) {
    bool shrinkWrap = true;
    return ListView.separated(
      shrinkWrap: shrinkWrap,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: apv.answers.length,
      separatorBuilder: (BuildContext context, int index) {
        return uiGlobals.divider;
      },
      itemBuilder: (BuildContext context, int index) {
        var item = apv.answers[index];
        return _answerItem(context, item, apv);
      },
    );
  }

  FadeInUp _answerItem(
      BuildContext context, AnswerModel item, AnswerViewModel apv) {
    return FadeInUp(
      child: Column(
        crossAxisAlignment: context.crossAxisAStart,
        children: [
          context.emptySizedHeightBox2x,
          QuestionOrAnswerSection(content: "${item.content}"),
          context.emptySizedHeightBox3x,
          _answerLikeSection(apv, item, context),
          context.emptySizedHeightBox3x,
        ],
      ),
    );
  }

  LikeAndUserInfo _answerLikeSection(
      AnswerViewModel apv, AnswerModel item, BuildContext context) {
    String favLength = "${item.fav?.length}";
    String username = "${item.user?.name} ${item.user?.lastname}";
    String createdAt = "answered ${globals.formatDate(item.createdAt)}";
    return LikeAndUserInfo(
      onPressed: () async {
        String aId = "${item.sId}";
        apv.answerFavOperation(
          answerModel: item,
          context: context,
          pv: apv,
          qId: id,
          aId: aId,
        );
      },
      likeColor: apv.isFavAnswer(
        item,
        context,
      ),
      favLength: favLength,
      createdAt: createdAt,
      username: username,
    );
  }
}
