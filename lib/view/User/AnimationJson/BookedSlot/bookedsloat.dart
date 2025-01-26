import 'dart:async';
import 'package:doctor_app/view/User/bottomNavigationbar/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Bookedsloat extends StatefulWidget {
  const Bookedsloat({super.key});

  @override
  State<Bookedsloat> createState() => _BookedsloatState();
}

class _BookedsloatState extends State<Bookedsloat> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (ctx) => const Navigationpage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset('asset/Animation - 1737885343132.json'),
      ),
    );
  }
}
