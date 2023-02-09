import 'package:ecommerce/provider/app_config_provider.dart';
import 'package:ecommerce/ui/home/home_Screen.dart';
import 'package:ecommerce/ui/login/login_screen.dart';
import 'package:ecommerce/ui/register/register_screen.dart';
import 'package:ecommerce/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppConfigProvider(),
      child: MyApplication()));
}

class MyApplication extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF004182),
            elevation: 0,
          ),
          primaryColor: const Color(0xFF004182),
          scaffoldBackgroundColor: const Color(0xFF004182)),
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (context) =>  SplashScreen(),
        ReigsterScreen.routeName: (context) => ReigsterScreen(),
        LoginScreen.routeName: (context) =>  LoginScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      initialRoute: LoginScreen.routeName,
    );
  }
}
