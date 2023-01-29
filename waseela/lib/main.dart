import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:waseela/pages/billing_details.dart';
import 'package:waseela/pages/donor_dashboard.dart';
import 'package:waseela/pages/explore.dart';
import 'package:waseela/pages/login_screen.dart';
import 'package:waseela/pages/register_donor.dart';
import 'package:waseela/pages/register_need.dart';
import 'package:waseela/pages/select_type.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
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
        duration: 500,
        backgroundColor: Color(0xFF0f2d2d),
        nextScreen: Explore("+921234567890"),
        // nextScreen: StreamBuilder<User?>(
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       return Explore(snapshot.data!.phoneNumber!);
        //     } else {
        //       return LoginScreen();
        //     }
        //   },
        // ),
      ),
    );
  }
}
