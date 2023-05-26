import 'package:flutter/material.dart';

class Constants {
  static String appName = "S:Tour";

  //Colors for theme
  static Color lightPrimary = const Color.fromARGB(255, 1, 210, 142);
  static Color darkPrimary = const Color.fromARGB(255, 0, 75, 50);
  static Color lightAccent = const Color.fromARGB(255, 246, 240, 120);
  static Color darkAccent = const Color.fromARGB(255, 109, 80, 0);
  static Color lightBG = const Color.fromARGB(251, 255, 255, 255);
  static Color darkBG = const Color.fromARGB(0, 0, 0, 0);
  static Color ratingBG = const Color.fromARGB(252, 255, 255, 85);

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
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    //backgroundColor: darkBG,
    primaryColor: darkPrimary,
    colorScheme: ColorScheme.fromSeed(seedColor: darkAccent),
    scaffoldBackgroundColor: darkBG,
    //cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      toolbarTextStyle: TextStyle(
        color: lightBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}
