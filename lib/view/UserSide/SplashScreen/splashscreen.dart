import 'dart:async';

import 'package:doctor_app/view/UserSide/HomePage/homepage.dart';
import 'package:doctor_app/view/UserSide/bottomNavigationbar/bottombar.dart';
import 'package:doctor_app/view/UserSide/loginAndSignUP/LoginPage/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () => cheackuserLoginOrNot());
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }

  cheackuserLoginOrNot() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Navigationpage()),
        (route) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Loginpage()),
        (route) => false,
      );
    }
  }
}
