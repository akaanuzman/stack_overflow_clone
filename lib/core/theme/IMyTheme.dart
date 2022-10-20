// ignore_for_file: file_names

import 'package:stack_overflow_clone/core/theme/color/my_colors.dart';
import 'package:stack_overflow_clone/core/theme/text/my_texts.dart';

abstract class IMyTheme {
  MyColors get colors => MyColors.instance;
  MyTexts get texts => MyTexts.instance;
}
