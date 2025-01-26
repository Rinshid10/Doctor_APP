import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view/User/loginAndSignUP/RegisterPage/widgets/registerwidgets.dart';
import 'package:doctor_app/view/User/widgets/ReUse/widgets.dart';
import 'package:doctor_app/view_model/authenticationpovider.dart';
import 'package:doctor_app/view_model/otherprovider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Registerpage extends StatelessWidget {
  const Registerpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<Authenticationpovider, Otherprovider>(
      builder: (context, value, val2, child) => Scaffold(
        backgroundColor: ColorsConstents.backGroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textDemo(
                      text: 'Sign Up',
                      fontsized: 30,
                      fontwight: FontWeight.bold),
                  Gap(5),
                  Row(
                    children: [
                      textDemo(text: 'Already have a account?', fontsized: 20),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: textDemo(
                              text: 'Login',
                              fontsized: 20,
                              fontwight: FontWeight.bold,
                              colors: ColorsConstents.textBlueColor)),
                    ],
                  ),
                  Gap(30),
                  Column(
                    spacing: 20,
                    children: [
                      textfieldsInRegister(
                          prifixIcon: Icons.person,
                          hintText: "Username*",
                          controllers: value.username),
                      textfieldsInRegister(
                          prifixIcon: Icons.email,
                          hintText: "Email*",
                          controllers: value.email),
                      textfieldsInRegister(
                          prifixIcon: Icons.phone,
                          controllers: value.phonenumber,
                          hintText: "Phone Number*",
                          keyboardType: TextInputType.number),
                      textfieldsInRegisterOb(
                          suffixIcon: val2.boolIcons,
                          password: () => val2.isBoolInPassword(),
                          obsd: val2.istrue,
                          prifixIcon: Icons.lock,
                          hintText: "Password*",
                          controllers: value.password),
                      Column(
                        children: [
                          Hero(
                            tag: "Login",
                            child: eleButuonFoR(
                                text: 'Register',
                                voids: () {
                                  value.register(context);
                                }),
                          ),
                          Gap(10),
                          textDemo(
                              text: 'Or',
                              fontwight: FontWeight.bold,
                              fontsized: 15),
                          Gap(10),
                          containerGoogle()
                        ],
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
