import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view/UserSide/loginAndSignUP/RegisterPage/registerpage.dart';
import 'package:doctor_app/view/UserSide/loginAndSignUP/RegisterPage/widgets/registerwidgets.dart';
import 'package:doctor_app/view/UserSide/widgets/ReUse/widgets.dart';
import 'package:doctor_app/view_model/authenticationpovider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Authenticationpovider>(
        builder: (context, value, child) => SafeArea(
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
                        hintText: "Email*", controllers: email),
                    textfieldsInRegister(
                        hintText: "Password", controllers: password),
                    TextButton(
                        onPressed: () {},
                        child: textDemo(
                            text: 'Forgot Password ?',
                            fontsized: 18,
                            colors: ColorsConstents.buttonColors)),
                    eleButuonForLR(
                      voidfuc: () => value.login(
                          emails: email.text, password: password.text),
                    )
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
