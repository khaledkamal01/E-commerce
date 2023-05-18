import 'dart:async';

import 'package:easy_splash_screen/easy_splash_screen.dart';

import 'package:ecommerce/Forgotpassword.dart';
import 'package:ecommerce/Home.dart';
import 'package:ecommerce/Login%20success.dart';
import 'package:ecommerce/Profile.dart';
import 'package:ecommerce/Verification.dart';
import 'package:ecommerce/details.dart';
import 'package:ecommerce/registerAccount.dart';
import 'package:ecommerce/screen1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Welcomeback.dart';
import 'complete.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
final navigatorKey=GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      navigatorKey: navigatorKey,
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image(
        image: AssetImage('assets/images/splash_1.png'),
        height: 300,
        width: 200,
      ),
      logoWidth: 200,
      showLoader: false,
      title: Text("TOKOTO",
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
          )),
      navigator: Home(),
      durationInSeconds: 5,
    );
  }
}
