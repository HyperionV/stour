import 'package:flutter/material.dart';

class Constants {
  static String appName = "S:Tour";

  //Colors for theme
  static Color lightPrimary = const Color.fromARGB(255, 66, 98, 19);
  static Color text =
      const Color.fromARGB(255, 35, 52, 10); // chỉnh icon với lại text
  static Color darkPrimary = const Color(0xFFc3ff68);
  static Color lightgreen = const Color(0xFFc3ff68); // nền màu button
  static Color darkgreen = const Color.fromARGB(255, 66, 98, 19);
  static Color lightAccent = const Color(0xFF848ccf);
  static Color darkAccent = const Color.fromARGB(255, 183, 189, 240);
  static Color lightpp = const Color.fromARGB(255, 183, 189, 240);
  static Color darkpp = const Color(0xFF848ccf); // màu shadow
  static Color lightBG = const Color.fromARGB(250, 255, 255, 255);
  static Color darkBG = const Color.fromARGB(0, 0, 0, 0);
  static Color ratingBG = const Color(0xFFfff000);

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
