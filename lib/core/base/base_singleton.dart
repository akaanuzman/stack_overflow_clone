
import 'package:stack_overflow_clone/core/helpers/globals.dart';
import 'package:stack_overflow_clone/core/helpers/ui_globals.dart';
import 'package:stack_overflow_clone/core/theme/color/my_colors.dart';
import 'package:stack_overflow_clone/core/theme/my_theme.dart';
import 'package:stack_overflow_clone/core/theme/text/my_texts.dart';

abstract class BaseSingleton {
  MyColors get colors => MyColors.instance;
  MyTexts get texts => MyTexts.instance;
  MyTheme get theme => MyTheme.instance;
  Globals get globals => Globals.instance;
  UIGlobals get uiGlobals => UIGlobals.instance;
}