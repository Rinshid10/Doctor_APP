import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view/UserSide/loginAndSignUP/RegisterPage/widgets/registerwidgets.dart';
import 'package:doctor_app/view/UserSide/widgets/ReUse/widgets.dart';
import 'package:doctor_app/view_model/authenticationpovider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Registerpage extends StatelessWidget {
  const Registerpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Authenticationpovider>(
      builder: (context, value, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textDemo(
                    text: 'Sign Up', fontsized: 30, fontwight: FontWeight.bold),
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
                        hintText: "Username*", controllers: value.username),
                    textfieldsInRegister(
                        hintText: "Email*", controllers: value.email),
                    textfieldsInRegister(
                        controllers: value.phonenumber,
                        hintText: "Phone Number*",
                        keyboardType: TextInputType.number),
                    textfieldsInRegister(
                        hintText: "Password", controllers: value.password),
                    eleButuonFoR(
                        text: 'Register',
                        voids: () {
                          value.register(context);
                        })
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
