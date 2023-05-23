import 'package:flutter/material.dart';

class Constants {
  static String appName = "S:Tour";

  //Colors for theme
  static Color lightPrimary = const Color.fromRGBO(252, 252, 255, 1);
  static Color darkPrimary = const Color.fromRGBO(0, 0, 0, 1);
  static Color lightAccent = const Color.fromRGBO(68, 138, 255, 1);
  static Color darkAccent = const Color.fromRGBO(96, 125, 139, 1);
  static Color lightBG = const Color.fromRGBO(252, 252, 255, 1);
  static Color darkBG = const Color.fromRGBO(0, 0, 0, 1);
  static Color ratingBG = const Color.fromRGBO(253, 216, 53, 1);

  static ThemeData lightTheme = ThemeData(
    // backgroundColor: lightBG,
    primaryColor: lightPrimary,
    colorScheme: ColorScheme.fromSeed(seedColor: lightAccent),
    //cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      toolbarTextStyle: TextStyle(
        color: darkBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}
