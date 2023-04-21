import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/splash_view_model.dart';
import '../auth/login_view.dart';
import 'navbar_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final pv = Provider.of<SplashViewModel>(context, listen: false);
    return Scaffold(
      body: FutureBuilder(
        future: pv.getToken,
        builder: (_, snapShot) {
          switch (snapShot.connectionState) {
            case ConnectionState.waiting:
              return _body(context);
            default:
              if (snapShot.hasData && snapShot.data != null) {
                return !snapShot.data! ? LoginView() : NavbarView();
              }
              return _body(context);
          }
        },
      ),
    );
  }

  FadeInUp _body(BuildContext context) {
    return FadeInUp(
      child: Center(
        child: SvgPicture.asset(
          AppLocalizations.of(context)!.iconSvg,
        ),
      ),
    );
  }
}
