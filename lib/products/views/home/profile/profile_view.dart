import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stack_overflow_clone/core/base/base_singleton.dart';
import 'package:stack_overflow_clone/core/extensions/ui_extensions.dart';
import 'package:stack_overflow_clone/uikit/button/special_button.dart';
import 'package:stack_overflow_clone/uikit/decoration/special_container_decoration.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../core/enums/alert_enum.dart';
import '../../../../core/helpers/token.dart';
import '../../../viewmodels/user_view_model.dart';
import '../../auth/login_view.dart';
import 'edit_profile_view.dart';

class ProfileView extends StatelessWidget with BaseSingleton {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeInDown(
          child: Row(
            mainAxisAlignment: context.mainAxisASpaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.profileAppBarTitle),
              SpecialButton(
                borderRadius: context.borderRadius2x,
                buttonLabel: AppLocalizations.of(context)!.editProfile,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfileView(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      body: FadeInUp(
        child: Consumer<UserViewModel>(builder: (context, pv, _) {
          var user = pv.user;
          String memberDate = globals.formatDate(user.createdAt);
          String place = user.place ?? "null";
          String title = user.title ?? "null";
          int answerLength = user.answer?.length ?? 0;
          int questionLength = user.question?.length ?? 0;
          return ListView(
            padding: context.padding2x,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: context.dynamicHeight(0.1),
                      padding: context.padding2x,
                      decoration: SpecialContainerDecoration(context: context),
                      child: SvgPicture.asset(
                          AppLocalizations.of(context)!.iconSvg),
                    ),
                  ),
                  context.emptySizedWidthBox3x,
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: context.crossAxisAStart,
                      children: [
                        Text(
                          "${user.name} ${user.lastname}",
                          style: context.textTheme.headline6,
                        ),
                        context.emptySizedHeightBox1x,
                        Row(
                          children: [
                            Icon(
                              Icons.date_range,
                              color: colors.grey,
                              size: 16,
                            ),
                            context.emptySizedWidthBox2x,
                            Text("Member since $memberDate")
                          ],
                        ),
                        context.emptySizedHeightBox1x,
                        place != "null"
                            ? Row(
                                children: [
                                  Icon(
                                    Icons.place,
                                    color: colors.grey,
                                    size: 16,
                                  ),
                                  context.emptySizedWidthBox2x,
                                  Text(place),
                                  context.emptySizedWidthBox2x,
                                  user.website != null
                                      ? GestureDetector(
                                          onTap: () {
                                            launchUrlString("${user.website}");
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.language,
                                                color: colors.grey,
                                                size: 16,
                                              ),
                                              context.emptySizedWidthBox2x,
                                              Text(AppLocalizations.of(context)!
                                                  .website),
                                            ],
                                          ),
                                        )
                                      : context.emptySizedHeightBox1x,
                                ],
                              )
                            : context.emptySizedWidthBox1x,
                        context.emptySizedHeightBox1x,
                      ],
                    ),
                  )
                ],
              ),
              context.emptySizedHeightBox3x,
              title != "null"
                  ? Column(
                      crossAxisAlignment: context.crossAxisAStart,
                      children: [
                        Row(
                          mainAxisAlignment: context.mainAxisASpaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.about,
                              style: context.textTheme.headline6,
                            ),
                            TextButton(
                              onPressed: () {
                                uiGlobals.showAlertDialog(
                                  context: context,
                                  alertEnum: AlertEnum.AREUSURE,
                                  contentTitle: "Are you sure?",
                                  contentSubtitle:
                                      "Your account will be logged out. \nAre you sure?",
                                  buttonLabel:
                                      AppLocalizations.of(context)!.okButton,
                                  onTap: () {
                                    Token.deleteAll();
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginView(),
                                      ),
                                      (route) => false,
                                    );
                                  },
                                  secondButtonLabel: "CANCEL"
                                );
                              },
                              child: Text(
                                AppLocalizations.of(context)!.logout,
                                style: context.textTheme.headline6!
                                    .copyWith(color: colors.blue),
                              ),
                            )
                          ],
                        ),
                        context.emptySizedHeightBox2x,
                        Container(
                          padding: context.padding4x,
                          decoration:
                              SpecialContainerDecoration(context: context),
                          alignment: context.alignmentCenter,
                          child: Text(title),
                        ),
                      ],
                    )
                  : context.emptySizedHeightBox1x,
              context.emptySizedHeightBox3x,
              Row(
                mainAxisAlignment: context.mainAxisASpaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.answers,
                    style: context.textTheme.headline6,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      AppLocalizations.of(context)!.seeAll,
                      style: context.textTheme.headline6!
                          .copyWith(color: colors.blue),
                    ),
                  )
                ],
              ),
              context.emptySizedHeightBox2x,
              Container(
                padding: context.padding4x,
                decoration: SpecialContainerDecoration(context: context),
                alignment: context.alignmentCenter,
                child: Text(
                  answerLength != 0
                      ? "You have answered $answerLength question."
                      : AppLocalizations.of(context)!.noAnswered,
                ),
              ),
              context.emptySizedHeightBox3x,
              Row(
                mainAxisAlignment: context.mainAxisASpaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.questionsTitle,
                    style: context.textTheme.headline6,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      AppLocalizations.of(context)!.seeAll,
                      style: context.textTheme.headline6!
                          .copyWith(color: colors.blue),
                    ),
                  )
                ],
              ),
              context.emptySizedHeightBox2x,
              Container(
                padding: context.padding4x,
                decoration: SpecialContainerDecoration(context: context),
                alignment: context.alignmentCenter,
                child: Text(
                  questionLength != 0
                      ? "You have asked $questionLength question."
                      : AppLocalizations.of(context)!.noAsked,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
