import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../products/viewmodels/answer_view_model.dart';
import '../../products/viewmodels/api_view_model.dart';
import '../../products/viewmodels/login_view_model.dart';
import '../../products/viewmodels/navbar_view_model.dart';
import '../../products/viewmodels/password_view_model.dart';
import '../../products/viewmodels/question_view_model.dart';
import '../../products/viewmodels/register_view_model.dart';
import '../../products/viewmodels/splash_view_model.dart';
import '../../products/viewmodels/user_view_model.dart';
import '../utils/navigation_service.dart';

class AppConstants {
  static AppConstants? _instance;
  static AppConstants get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = AppConstants.init();
      return _instance!;
    }
  }

  AppConstants.init();

  String get appTitle => "Stack Overflow Clone";
  bool get debugShowCheckedModeBanner => false;
  get localizationsDelegates => AppLocalizations.localizationsDelegates;
  get supportedLocales => AppLocalizations.supportedLocales;
  get navigatorKey => NavigationService.navigatorKey;

  final List<SingleChildWidget> _providers = [
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
    ChangeNotifierProvider(
      create: (_) => ApiViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => UserViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => PasswordViewModel(),
    ),
  ];

  List<SingleChildWidget> get providers => _providers;
}
