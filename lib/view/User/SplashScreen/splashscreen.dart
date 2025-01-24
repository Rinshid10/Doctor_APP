import 'dart:async';

import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view/User/HomePage/homepage.dart';
import 'package:doctor_app/view/User/bottomNavigationbar/bottombar.dart';
import 'package:doctor_app/view/User/loginAndSignUP/LoginPage/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Timer(Duration(seconds: 3), () => cheackuserLoginOrNot());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstents.backGroundColor,
      body: Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: Image(
            image: AssetImage('asset/baground-removebg-preview.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
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
