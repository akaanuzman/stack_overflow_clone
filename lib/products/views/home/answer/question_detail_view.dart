// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stack_overflow_clone/products/models/answer_model.dart';
import '../../../viewmodels/question_view_model.dart';
import 'add_answer_view.dart';
import '../../../../uikit/decoration/special_container_decoration.dart';
import '../../../../uikit/skeleton/skeleton_list.dart';
import '../../../../core/base/base_singleton.dart';
import '../../../../core/extensions/ui_extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../uikit/button/special_button.dart';
import '../../../models/question_model.dart';
import '../../../viewmodels/answer_view_model.dart';

class QuestionDetailView extends StatelessWidget with BaseSingleton {
  final String id;
  const QuestionDetailView({
    super.key,
    required this.id,
  });

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

  Color isFavQuestion(QuestionModel model) {
    if (model.fav != null) {
      for (var e in model.fav!) {
        if (model.user?.sId == e.sId)
          return colors.redAccent;
        else
          return colors.grey;
      }
    } else
      return colors.grey;
    return colors.grey;
  }

  Color isFavAnswer(QuestionModel model, AnswerModel answerModel) {
    if (answerModel.fav != null) {
      for (var e in answerModel.fav!) {
        if (model.user?.sId == e.sId) {
          return colors.redAccent;
        } else
          return colors.grey;
      }
    } else
      return colors.grey;
    return colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeInDown(
          child: Row(
            mainAxisAlignment: context.mainAxisASpaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.questionDetail),
              SpecialButton(
                buttonLabel: AppLocalizations.of(context)!.addAnswer,
                borderRadius: context.borderRadius2x,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddAnswerView(
                        questionId: id,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder(
        future: getQuestionAndAnswers(context),
        builder: (_, snapShot) {
          switch (snapShot.connectionState) {
            case ConnectionState.waiting:
              return SkeletonList();
            default:
              return FadeInUp(
                child: Consumer<QuestionViewModel>(builder: (context, pv, _) {
                  final question = pv.question;
                  return ListView(
                    padding: context.padding2x,
                    children: [
                      Text(
                        question.title ?? "null_title",
                        style: context.textTheme.headline6,
                      ),
                      context.emptySizedHeightBox1x,
                      Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.asked,
                                style: context.textTheme.subtitle2!
                                    .copyWith(color: colors.black54),
                              ),
                              context.emptySizedWidthBox1x,
                              Text(
                                globals.formatDate(question.createdAt),
                                style: context.textTheme.subtitle2,
                              ),
                            ],
                          ),
                          context.emptySizedWidthBox2x,
                          Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.modified,
                                style: context.textTheme.subtitle2!
                                    .copyWith(color: colors.black54),
                              ),
                              context.emptySizedWidthBox1x,
                              Text(
                                "today",
                                style: context.textTheme.subtitle2,
                              ),
                            ],
                          ),
                        ],
                      ),
                      context.emptySizedHeightBox2x,
                      uiGlobals.divider,
                      context.emptySizedHeightBox2x,
                      Container(
                        padding: context.padding2x,
                        decoration: SpecialContainerDecoration(
                          context: context,
                          color: colors.grey3,
                        ),
                        child: Text(
                          question.subtitle ?? "null_subtitle",
                        ),
                      ),
                      context.emptySizedHeightBox3x,
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () async {},
                                  icon: Icon(
                                    Icons.favorite,
                                    color: isFavQuestion(question),
                                  ),
                                ),
                                context.emptySizedWidthBox2x,
                                Expanded(
                                  child: Text(
                                    "${question.fav?.length}",
                                    style:
                                        context.textTheme.subtitle1!.copyWith(
                                      fontWeight: context.fw700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Wrap(
                              children: [
                                Column(
                                  crossAxisAlignment: context.crossAxisAStart,
                                  children: [
                                    Text(
                                      "asked ${globals.formatDate(question.createdAt)}",
                                      style: context.textTheme.caption!
                                          .copyWith(color: colors.blue6),
                                    ),
                                    Text(
                                      "${question.user?.name} ${question.user?.lastname}",
                                      style: context.textTheme.caption!
                                          .copyWith(color: colors.blue8),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      context.emptySizedHeightBox5x,
                      Text(
                        "${question.answer?.length} Answers",
                        style: context.textTheme.headline6,
                      ),
                      context.emptySizedHeightBox2x,
                      uiGlobals.divider,
                      Consumer<AnswerViewModel>(
                        builder: (BuildContext context, AnswerViewModel pv, _) {
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: pv.answers.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return uiGlobals.divider;
                            },
                            itemBuilder: (BuildContext context, int index) {
                              var item = pv.answers[index];
                              return Column(
                                crossAxisAlignment: context.crossAxisAStart,
                                children: [
                                  context.emptySizedHeightBox2x,
                                  Container(
                                    width: double.maxFinite,
                                    padding: context.padding2x,
                                    decoration: SpecialContainerDecoration(
                                      context: context,
                                      color: colors.grey3,
                                    ),
                                    child: Text(
                                      "${item.content}",
                                    ),
                                  ),
                                  context.emptySizedHeightBox3x,
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            IconButton(
                                              onPressed: () async {},
                                              icon: Icon(
                                                Icons.favorite,
                                                color:
                                                    isFavAnswer(question, item),
                                              ),
                                            ),
                                            context.emptySizedWidthBox2x,
                                            Expanded(
                                              child: Text(
                                                "${item.fav?.length}",
                                                style: context
                                                    .textTheme.subtitle1!
                                                    .copyWith(
                                                  fontWeight: context.fw700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Wrap(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  context.crossAxisAStart,
                                              children: [
                                                Text(
                                                  "answered ${globals.formatDate(item.createdAt)}",
                                                  style: context
                                                      .textTheme.caption!
                                                      .copyWith(
                                                          color: colors.blue6),
                                                ),
                                                Text(
                                                  "${item.user?.name} ${item.user?.lastname}",
                                                  style: context
                                                      .textTheme.caption!
                                                      .copyWith(
                                                          color: colors.blue8),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  context.emptySizedHeightBox3x,
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  );
                }),
              );
          }
        },
      ),
    );
  }
}
