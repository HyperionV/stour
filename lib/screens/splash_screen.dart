// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    _animateLogo();
  }

  void _animateLogo() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      _opacity = 1;
    });
    await Future.delayed(Duration(seconds: 2));
    // Navigate to the next screen after the animation is complete
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(seconds: 2),
          child: Image.asset(
            'assets/logo.png',
            height: 150,
          ),
        ),
      ),
    );
  }
}
