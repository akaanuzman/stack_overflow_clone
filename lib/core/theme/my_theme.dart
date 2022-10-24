import 'IMyTheme.dart';
import 'text/my_texts.dart';
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

  ThemeData get themeData => ThemeData(
        textTheme: MyTexts.instance.textTheme,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: colors.black),
          color: colors.white,
          elevation: 0,
          titleTextStyle: texts.textTheme.headline6
        ),
      );
}
