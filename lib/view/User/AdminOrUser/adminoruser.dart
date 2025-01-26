import 'dart:developer';

import 'package:doctor_app/services/AdminLogin/adminlogin.dart';
import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view/User/loginAndSignUP/LoginPage/loginpage.dart';
import 'package:doctor_app/view/User/widgets/ReUse/widgets.dart';
import 'package:doctor_app/view_model/adminlogin.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Adminoruser extends StatelessWidget {
  const Adminoruser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstents.backGroundColor,
      body: SafeArea(
          child: Consumer<Adminlogin>(
        builder: (context, value, child) => Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: Image(
                    image: AssetImage('asset/baground-removebg-preview.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                Gap(50),
                Hero(
                  tag: "Login",
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: ColorsConstents.textBlueColor),
                      onPressed: () {
                        value.adminAlredyLogin(context);
                      },
                      child: Text(
                        'Admin ',
                        style: TextStyle(
                            color: ColorsConstents.textWhiteColor,
                            fontSize: 18),
                      )),
                ),
                Gap(25),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            side:
                                BorderSide(color: ColorsConstents.buttonColors),
                            borderRadius: BorderRadius.circular(10)),
                        minimumSize: Size(double.infinity, 50),
                        backgroundColor: ColorsConstents.textWhiteColor),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Loginpage()));
                      // value.adminAlredyLogin(context);
                    },
                    child: Text(
                      'User ',
                      style: TextStyle(
                          color: ColorsConstents.textBlueColor, fontSize: 18),
                    )),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
