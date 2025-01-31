import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view/User/loginAndSignUP/RegisterPage/registerpage.dart';
import 'package:doctor_app/view/User/loginAndSignUP/RegisterPage/widgets/registerwidgets.dart';
import 'package:doctor_app/view/User/widgets/ReUse/widgets.dart';
import 'package:doctor_app/view_model/authenticationpovider.dart';
import 'package:doctor_app/view_model/otherprovider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable

class Loginpage extends StatelessWidget {
  Loginpage({super.key});

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstents.backGroundColor,
      body: Consumer2<Authenticationpovider, Otherprovider>(
        builder: (context, value, val2, child) => SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textDemo(
                      text: 'Login', fontsized: 30, fontwight: FontWeight.bold),
                  Gap(5),
                  Row(
                    children: [
                      textDemo(text: 'Dont have an account?', fontsized: 18),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Registerpage()));
                          },
                          child: textDemo(
                              text: 'Register',
                              fontsized: 20,
                              fontwight: FontWeight.bold,
                              colors: ColorsConstents.textBlueColor)),
                    ],
                  ),
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
                          suffixIcon: val2.boolIcons,
                          password: () => val2.isBoolInPassword(),
                          obsd: val2.istrue,
                          prifixIcon: Icons.lock,
                          hintText: "Password*",
                          controllers: password),
                      TextButton(
                          onPressed: () {},
                          child: textDemo(
                              text: 'Forgot Password ?',
                              fontsized: 18,
                              colors: ColorsConstents.buttonColors)),
                      Hero(
                        tag: "Login",
                        child: eleButuonForLR(voidfuc: () {
                          value.loginSupaBase(email.text, password.text);

                          value.login(
                              context: context,
                              emails: email.text,
                              password: password.text);
                        }),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
