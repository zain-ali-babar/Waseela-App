import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:waseela/pages/donor/billing_details.dart';
import 'package:waseela/pages/donor/donor_dashboard.dart';
import 'package:waseela/pages/donor/explore.dart';
import 'package:waseela/pages/needy/register_need.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset('images/waseela_eng_color.png'),
        splashIconSize: 120,
        splashTransition: SplashTransition.fadeTransition,
        duration: 2500,
        backgroundColor: Color(0xFF0f2d2d),
        nextScreen: RegisterNeed(),
      ),
    );
  }
}
