import 'dart:developer';

import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view/Admin/AddDoctor/adddoctor.dart';
import 'package:doctor_app/view/Admin/AdminHomepage/widgets.dart';
import 'package:doctor_app/view/Admin/Viewuser/viewuser.dart';
import 'package:doctor_app/view/Admin/view_model/userdetailsprovider.dart';
import 'package:doctor_app/view/UserSide/widgets/ReUse/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Adminhomepage extends StatelessWidget {
  const Adminhomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Userdetailsprovider>(
        builder: (context, value, child) => SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textDemo(
                  text: 'Welcome', fontsized: 15, fontwight: FontWeight.w900),
              Row(
                children: [
                  textDemo(
                      text: 'Hosipital Name',
                      fontsized: 25,
                      fontwight: FontWeight.w900),
                  Spacer(),
                  CircleAvatar(
                    backgroundColor: ColorsConstents.buttonColors,
                  )
                ],
              ),
              Gap(25),
              Row(
                children: [
                  Expanded(
                      child: cont(
                          callback: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Viewuser()));
                          },
                          colors: ColorsConstents.buttonColors,
                          name: 'View User Details',
                          another: value.listUserData.length.toString())),
                  Gap(15),
                  Expanded(
                      child: cont(
                          callback: () {},
                          colors: const Color.fromARGB(255, 242, 91, 80),
                          name: 'View Appoinments',
                          another: '20')),
                ],
              ),
              Gap(20),
              Row(
                children: [
                  Expanded(
                      child: cont(
                          callback: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdddoctorInAdmin()));
                          },
                          colors: Colors.amber,
                          another: '10',
                          name: 'Add Doctor')),
                  Gap(15),
                  Expanded(
                      child: cont(
                          callback: () {},
                          colors: Colors.blue,
                          name: 'Available Doctor',
                          another: '10')),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
