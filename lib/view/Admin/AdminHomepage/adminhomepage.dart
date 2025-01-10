import 'dart:developer';
import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view/Admin/AddDoctor/adddoctor.dart';
import 'package:doctor_app/view/Admin/AdminHomepage/widgets.dart';
import 'package:doctor_app/view/Admin/Pichartes/AppoimentPiechart/appoimentpie.dart';
import 'package:doctor_app/view/Admin/ViewAll%20Appoiment/adminAppoiment.dart';
import 'package:doctor_app/view/Admin/Viewuser/viewuser.dart';
import 'package:doctor_app/view/Admin/view_model/userdetailsprovider.dart';
import 'package:doctor_app/view/User/widgets/ReUse/widgets.dart';
import 'package:doctor_app/view_model/appoiment.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Adminhomepage extends StatelessWidget {
  const Adminhomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstents.backGroundColor,
      body: Consumer2<Userdetailsprovider, AppoimentProvider>(
        builder: (context, value, appoimnets, child) => SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
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
                Gap(20),
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
                    Gap(5),
                    Expanded(
                        child: cont(
                            callback: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Adminappoiment()));
                            },
                            colors: const Color.fromARGB(255, 242, 91, 80),
                            name: 'View Appoinments',
                            another: appoimnets.listOfAppoimentFOrAdmin.length
                                .toString())),
                  ],
                ),
                Gap(5),
                Row(
                  children: [
                    Expanded(
                        child: cont(
                            callback: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AdddoctorInAdmin()));
                            },
                            colors: Colors.amber,
                            another: '10',
                            name: 'Add Doctor')),
                    Gap(5),
                    Expanded(
                        child: cont(
                            callback: () {},
                            colors: Colors.blue,
                            name: 'Available Doctor',
                            another: '10')),
                  ],
                ),
                Gap(20),
                Card(
                  color: ColorsConstents.backGroundColor,
                  elevation: 3,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 500,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textDemo(
                            fontsized: 15,
                            text: 'View All Details',
                            fontwight: FontWeight.bold),
                        Gap(15),
                        GestureDetector(
                          onTap: () {
                            log('taped');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AppoimentPieChart()));
                          },
                          child: detaialsCard(
                              colors: Color.fromARGB(255, 242, 91, 80),
                              text: 'Appoiment Details'),
                        ),
                        Gap(5),
                        GestureDetector(
                          onTap: () {},
                          child: detaialsCard(
                              colors: ColorsConstents.buttonColors,
                              text: 'User Verifications'),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
