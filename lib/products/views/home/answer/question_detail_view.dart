import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stack_overflow_clone/products/views/home/answer/add_answer_view.dart';
import 'package:stack_overflow_clone/uikit/skeleton/skeleton_list.dart';
import '../../../../core/base/base_singleton.dart';
import '../../../../core/extensions/ui_extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../uikit/button/special_button.dart';
import '../../../models/question_model.dart';
import '../../../viewmodels/answer_view_model.dart';

class QuestionDetailView extends StatelessWidget with BaseSingleton {
  final QuestionModel model;
  const QuestionDetailView({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    final pv = Provider.of<AnswerViewModel>(context, listen: false);
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
                      builder: (context) => AddAnswerView(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder(
        future: pv.getAllAnswers(qId: model.sId ?? "null_id"),
        builder: (_, snapShot) {
          switch (snapShot.connectionState) {
            case ConnectionState.waiting:
              return SkeletonList();
            default:
              return FadeInUp(
                child: ListView(
                  padding: context.padding2x,
                  children: [
                    Text(
                      model.title ?? "null_title",
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
                              globals.formatDate(model.createdAt),
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
                    Text(
                      model.subtitle ?? "null_subtitle",
                    ),
                    context.emptySizedHeightBox3x,
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                color: colors.grey,
                              ),
                              context.emptySizedWidthBox2x,
                              Expanded(
                                child: Text(
                                  "${model.fav?.length}",
                                  style: context.textTheme.subtitle1!.copyWith(
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
                                    "edited ${globals.formatDate(model.createdAt)}",
                                    style: context.textTheme.caption!
                                        .copyWith(color: colors.blue6),
                                  ),
                                  Text(
                                    "${model.user?.name} ${model.user?.lastname}",
                                    style: context.textTheme.caption!
                                        .copyWith(color: colors.blue8),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        context.emptySizedWidthBox2x,
                        Expanded(
                          child: Wrap(
                            children: [
                              Column(
                                crossAxisAlignment: context.crossAxisAStart,
                                children: [
                                  Text(
                                    "edited ${globals.formatDate(model.createdAt)}",
                                    style: context.textTheme.caption!
                                        .copyWith(color: colors.blue6),
                                  ),
                                  Text(
                                    "username",
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
                    context.emptySizedHeightBox3x,
                    Text(
                      "${model.answer?.length} Answers",
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
                          separatorBuilder: (BuildContext context, int index) {
                            return uiGlobals.divider;
                          },
                          itemBuilder: (BuildContext context, int index) {
                            var item = pv.answers[index];
                            return Column(
                              crossAxisAlignment: context.crossAxisAStart,
                              children: [
                                context.emptySizedHeightBox2x,
                                Text(
                                  "${item.content}",
                                ),
                                context.emptySizedHeightBox3x,
                                Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.favorite,
                                            color: colors.grey,
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
                                                "edited Apr 12, 2019 at 9:47",
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
                                    context.emptySizedWidthBox2x,
                                    Expanded(
                                      child: Wrap(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                context.crossAxisAStart,
                                            children: [
                                              Text(
                                                "edited Apr 12, 2019 at 9:47",
                                                style: context
                                                    .textTheme.caption!
                                                    .copyWith(
                                                        color: colors.blue6),
                                              ),
                                              Text(
                                                "username",
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
                ),
              );
          }
        },
      ),
    );
  }
}
