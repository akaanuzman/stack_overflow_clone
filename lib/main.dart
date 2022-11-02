import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'products/viewmodels/answer_view_model.dart';
import 'products/viewmodels/question_view_model.dart';
import 'core/utils/navigation_service.dart';
import 'products/viewmodels/navbar_view_model.dart';
import 'products/viewmodels/splash_view_model.dart';
import 'products/views/common/splash_view.dart';
import 'core/base/base_singleton.dart';
import 'products/viewmodels/login_view_model.dart';
import 'products/viewmodels/register_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => LoginViewModel(),
          ),
          ChangeNotifierProvider(
            create: (_) => RegisterViewModel(),
          ),
          ChangeNotifierProvider(
            create: (_) => SplashViewModel(),
          ),
          ChangeNotifierProvider(
            create: (_) => NavbarViewModel(),
          ),
          ChangeNotifierProvider(
            create: (_) => QuestionViewModel(),
          ),
          ChangeNotifierProvider(
            create: (_) => AnswerViewModel(),
          ),
        ],
        child: const MyApp(),
      ),
    );


class MyApp extends StatelessWidget with BaseSingleton {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack Overflow Clone',
      theme: theme.themeData,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const SplashView(),
      navigatorKey: NavigationService.navigatorKey,
    );
  }
}
