import 'package:stack_overflow_clone/core/theme/IMyTheme.dart';
import 'package:stack_overflow_clone/core/theme/text/my_texts.dart';
import 'package:flutter/material.dart';

class MyTheme extends IMyTheme {
  static MyTheme? _instance;
  static MyTheme get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = MyTheme.init();
      return _instance!;
    }
  }

  MyTheme.init();

  final ThemeData _themeData = ThemeData(
    textTheme: MyTexts.instance.textTheme,
  );
  ThemeData get themeData => _themeData;
}
