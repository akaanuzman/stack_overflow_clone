import 'package:flutter/material.dart';

import '../color/my_colors.dart';

class MyTexts {
  static MyTexts? _instance;
  static MyTexts get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = MyTexts.init();
      return _instance!;
    }
  }

  MyTexts.init();

  MyColors get _colors => MyColors.instance;
  Color get _textColor => _colors.black;
  String get _fontFamily => 'Roboto';

  TextTheme get textTheme => TextTheme(
        //XX
        headline1: TextStyle(
          color: _textColor,
          fontSize: 96,
          fontWeight: FontWeight.w300,
          fontFamily: _fontFamily,
          fontStyle: FontStyle.normal,
        ),
        headline2: TextStyle(
          //XX
          color: _textColor,
          fontSize: 60,
          fontWeight: FontWeight.w300,
          fontFamily: _fontFamily,
          fontStyle: FontStyle.normal,
        ),
        headline3: TextStyle(
          //XX
          color: _textColor,
          fontSize: 48,
          fontWeight: FontWeight.w400,
          fontFamily: _fontFamily,
          fontStyle: FontStyle.normal,
        ),
        headline4: TextStyle(
          //XX
          color: _textColor,
          fontSize: 34,
          fontWeight: FontWeight.w400,
          fontFamily: _fontFamily,
          fontStyle: FontStyle.normal,
        ),
        headline5: TextStyle(
          //XX
          color: _textColor,
          fontSize: 24,
          fontWeight: FontWeight.w700,
          fontFamily: _fontFamily,
          fontStyle: FontStyle.normal,
        ),
        headline6: TextStyle(
          //XX
          color: _textColor,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontFamily: _fontFamily,
          fontStyle: FontStyle.normal,
        ),
        subtitle1: TextStyle(
          color: _textColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: _fontFamily,
          fontStyle: FontStyle.normal,
        ),
        subtitle2: TextStyle(
          color: _textColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: _fontFamily,
          fontStyle: FontStyle.normal,
          letterSpacing: -0.5
        ),
        bodyText1: TextStyle(
          color: _textColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: _fontFamily,
          fontStyle: FontStyle.normal,
        ),
        bodyText2: TextStyle(
          color: _textColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: _fontFamily,
          fontStyle: FontStyle.normal,
        ),
        button: TextStyle(
          color: _colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          fontFamily: _fontFamily,
          fontStyle: FontStyle.normal,
        ),
        caption: TextStyle(
          color: _textColor,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontFamily: _fontFamily,
          fontStyle: FontStyle.normal,
        ),
        overline: TextStyle(
          color: _textColor,
          fontSize: 10,
          fontWeight: FontWeight.w400,
          fontFamily: _fontFamily,
          fontStyle: FontStyle.normal,
        ),
      );
}
