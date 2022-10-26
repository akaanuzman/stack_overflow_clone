import 'package:flutter/material.dart';
import '../../../core/extensions/ui_extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/helpers/token.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
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
                child: Text("weokfwkoeo"),
              ),
            ],
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            separatorBuilder: (BuildContext context, int index) {
              return context.emptySizedHeightBox1x;
            },
            itemBuilder: (BuildContext context, int index) {
              return Text("wekofoekw");
            },
          ),
        ],
      ),
    );
  }
}
