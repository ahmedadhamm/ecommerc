import 'dart:async';
import 'package:ecommerce/ui/register/register_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash';


  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, ReigsterScreen.routeName);
    });
    return Scaffold(
      body: Image.asset(
        "assets/images/Splash Screen.png",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
