import 'package:flutter/material.dart';
import 'package:stour/screens/main_screen.dart';
import 'package:stour/util/const.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      home: SplashScreen(),
      routes: {
        '/home': (context) => const MainScreen(),
      },
    );
  }
}
