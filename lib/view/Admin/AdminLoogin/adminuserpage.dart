import 'dart:developer';
import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view/User/loginAndSignUP/RegisterPage/widgets/registerwidgets.dart';
import 'package:doctor_app/view/User/widgets/ReUse/widgets.dart';
import 'package:doctor_app/view_model/adminlogin.dart';
import 'package:doctor_app/view_model/otherprovider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AdminLoginPage extends StatelessWidget {
  AdminLoginPage({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<Adminlogin, Otherprovider>(
        builder: (context, value, value2, child) => SafeArea(
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
                        prifixIcon: Icons.email,
                        hintText: "Email*",
                        controllers: email),
                    textfieldsInRegisterOb(
                        obsd: value2.istrue,
                        password: () {
                          value2.isBoolInPassword();
                          log('fdf');
                          log(value2.istrue.toString());
                        },
                        suffixIcon: value2.boolIcons,
                        prifixIcon: Icons.lock,
                        hintText: "Password",
                        controllers: password),
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
