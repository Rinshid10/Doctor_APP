import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view/UserSide/DoctorPage/doctorpage.dart';
import 'package:doctor_app/view/UserSide/HomePage/homepage.dart';
import 'package:doctor_app/view/UserSide/MyAppoiment/appoinmentpage.dart';
import 'package:doctor_app/view_model/bottombart.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class Navigationpage extends StatelessWidget {
  const Navigationpage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BottombartProvider>(
      builder: (context, values, child) => Scaffold(
        body: pages[values.curruntIndex],
        bottomNavigationBar: GNav(
            selectedIndex: values.curruntIndex,
            curve: Curves.bounceIn,
            onTabChange: (value) {
              values.onchanged(value);
            },
            color: Colors.black,
            backgroundColor: ColorsConstents.textWhiteColor,
            activeColor: ColorsConstents.buttonColors,
            gap: 8,
            tabs: const [
              GButton(
                icon: (Icons.home),
                text: 'Home',
              ),
              GButton(
                icon: (Icons.people),
                text: 'Doctors',
              ),
              GButton(
                icon: (Icons.content_paste),
                text: 'My Appoiments',
              ),
            ]),
      ),
    );
  }
}

var pages = [Homepage(), Doctorpage(), Appoinmentpage()];
