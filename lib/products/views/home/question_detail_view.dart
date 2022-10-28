import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../core/base/base_singleton.dart';
import '../../../core/extensions/ui_extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuestionDetailView extends StatelessWidget with BaseSingleton {
  const QuestionDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeInDown(
          child: Row(
            mainAxisAlignment: context.mainAxisASpaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.questionDetail),
              ElevatedButton(
                onPressed: () {},
                child: Text(AppLocalizations.of(context)!.addAnswer),
              ),
            ],
          ),
        ),
      ),
      body: FadeInUp(
        child: ListView(
          padding: context.padding2x,
          children: [
            Text(
              "Creating a keyboard shortcut with python tkinter and get error TypeError: savF() takes 0 positional arguments but 1 was given",
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
                      "today",
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
              """
I have a ListView with ListTile. Each ListTile has a title with Text, subtitle with Text, and leading with an Image.

Now, the Image is too big and vertically stretches into the next row, overlapping the Image there.

How can I make sure that the Image stays within the bounds?

EDIT:

I’d like not to give the image a fixed size, but rather let it adjust to the height of the list tile as given by title+subtitle’s intrinsic height.""",
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
                          "1492",
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
                            "edited Apr 12, 2019 at 9:47",
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
                context.emptySizedWidthBox2x,
                Expanded(
                  child: Wrap(
                    children: [
                      Column(
                        crossAxisAlignment: context.crossAxisAStart,
                        children: [
                          Text(
                            "edited Apr 12, 2019 at 9:47",
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
              "5 Answers",
              style: context.textTheme.headline6,
            ),
            context.emptySizedHeightBox2x,
            uiGlobals.divider,
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              separatorBuilder: (BuildContext context, int index) {
                return uiGlobals.divider;
              },
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Text(
                      """
I have a ListView with ListTile. Each ListTile has a title with Text, subtitle with Text, and leading with an Image.

Now, the Image is too big and vertically stretches into the next row, overlapping the Image there.

How can I make sure that the Image stays within the bounds?

EDIT:

I’d like not to give the image a fixed size, but rather let it adjust to the height of the list tile as given by title+subtitle’s intrinsic height.""",
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
                                  "1492",
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
                                    "edited Apr 12, 2019 at 9:47",
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
                        context.emptySizedWidthBox2x,
                        Expanded(
                          child: Wrap(
                            children: [
                              Column(
                                crossAxisAlignment: context.crossAxisAStart,
                                children: [
                                  Text(
                                    "edited Apr 12, 2019 at 9:47",
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
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
