import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:stack_overflow_clone/core/base/base_singleton.dart';
import '../../../core/extensions/ui_extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/helpers/token.dart';

class HomeView extends StatelessWidget with BaseSingleton {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeInDown(
          child: Row(
            mainAxisAlignment: context.mainAxisASpaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.questionsTitle,
                style: context.textTheme.headline6,
              ),
              ElevatedButton(
                onPressed: () {
                  Token.deleteAll();
                },
                child: Text(AppLocalizations.of(context)!.askQuestion),
              ),
            ],
          ),
        ),
      ),
      body: FadeInUp(
        child: ListView(
          children: [
            Container(
              padding: context.padding1x,
              color: colors.yellow1.withOpacity(0.65),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 15,
                separatorBuilder: (BuildContext context, int index) {
                  return uiGlobals.divider;
                },
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          "0 likes 0 answers",
                          style: context.textTheme.subtitle2,
                        ),
                        subtitle: Text(
                          "Creating a keyboard shortcut with python tkinter and get error TypeError: savF() takes 0 positional arguments but 1 was given",
                          style: context.textTheme.subtitle1!.copyWith(
                            fontWeight: context.fw600,
                            color: colors.blue6,
                          ),
                        ),
                      ),
                      context.emptySizedHeightBox1x,
                      Row(
                        mainAxisAlignment: context.mainAxisAEnd,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "username ",
                                  style: context.textTheme.subtitle2!
                                      .copyWith(color: colors.blue6),
                                ),
                                TextSpan(
                                  text: "1 asked ",
                                  style: context.textTheme.subtitle2!.copyWith(
                                    color: colors.black54,
                                    fontWeight: context.fw700,
                                  ),
                                ),
                                TextSpan(
                                  text: "2 seconds ago",
                                  style: context.textTheme.subtitle2!.copyWith(
                                    color: colors.black45,
                                    fontWeight: context.fw500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
