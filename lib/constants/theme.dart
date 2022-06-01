// ignore_for_file: unnecessary_const

import 'package:budventure_app/constants/color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData(
    backgroundColor: AppColors.white,
    textTheme: lightTextTheme,
  );

  static final TextTheme lightTextTheme = TextTheme(
    headline1: _headline1, //30px
    headline2: _headline2, //27px
    headline3: _headline3, //20px
    headline4: _headline4, //16px
    headline5: _headline5, //14px
    // headline6: _headline6, //20px

    // subtitle1: _subtitle1, //16px
    // subtitle2: _subtitle2, //13px
    // bodyText1: _bodyText1, //14px
    // bodyText2: _bodyText2, //14px //normal
    // button: _button, //14px
    // caption: _caption, //12px
    // overline: _overline, //10px
  );
  //Title
  static const TextStyle _headline1 = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColors.black,
    fontSize: 30,
  );
  //Product Name
  static const TextStyle _headline2 = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColors.black,
    fontSize: 27,
  );
  //
  static const TextStyle _headline3 = TextStyle(
    fontWeight: FontWeight.w800,
    color: AppColors.black,
    fontSize: 20,
  );

  static const TextStyle _headline4 = TextStyle(
    fontWeight: FontWeight.normal,
    color: AppColors.black,
    fontSize: 16,
  );
  static final TextStyle _headline5 = TextStyle(
    fontWeight: FontWeight.normal,
    color: AppColors.grey,
    fontSize: 14,
  );
}
