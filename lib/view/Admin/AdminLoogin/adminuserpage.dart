import 'dart:developer';

import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view/Admin/AdminHomepage/adminhomepage.dart';
import 'package:doctor_app/view/UserSide/loginAndSignUP/RegisterPage/registerpage.dart';
import 'package:doctor_app/view/UserSide/loginAndSignUP/RegisterPage/widgets/registerwidgets.dart';
import 'package:doctor_app/view/UserSide/widgets/ReUse/widgets.dart';
import 'package:doctor_app/view_model/adminlogin.dart';
import 'package:doctor_app/view_model/authenticationpovider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class AdminLoginPage extends StatelessWidget {
  AdminLoginPage({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Adminlogin>(
        builder: (context, value, child) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textDemo(
                    text: 'Admin Login',
                    fontsized: 30,
                    fontwight: FontWeight.bold),
                Gap(30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    textfieldsInRegister(
                        hintText: "Email*", controllers: email),
                    textfieldsInRegister(
                        hintText: "Password", controllers: password),
                    TextButton(
                        onPressed: () {},
                        child: textDemo(
                            text: 'Forgot Password ?',
                            fontsized: 18,
                            colors: ColorsConstents.buttonColors)),
                    eleButuon(
                        voidfuc: () {
                          value.adminLoginPage(
                              email.text, password.text, context);
                        },
                        child: value.cheackAdmin
                            ? CircularProgressIndicator()
                            : textDemo(
                                text: 'Login',
                                fontsized: 20,
                                fontwight: FontWeight.bold,
                                colors: ColorsConstents.textWhiteColor))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
