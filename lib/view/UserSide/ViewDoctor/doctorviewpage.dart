import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view/UserSide/AppoimentRetister/appoinmentRegester.dart';
import 'package:doctor_app/view/UserSide/ViewDoctor/widget.dart';
import 'package:doctor_app/view/UserSide/widgets/ReUse/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Doctorviewpage extends StatelessWidget {
  const Doctorviewpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstents.backGroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: textDemo(
            text: 'Dr.Rihan kuttiparamban',
            fontwight: FontWeight.bold,
            fontsized: 20),
        backgroundColor: ColorsConstents.textWhiteColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                child: Center(
                    child: Image(image: AssetImage('asset/doctor_image.png'))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  rowContainer(
                      text: 'Voice Call',
                      icons: Icons.phone,
                      colors: Colors.blue),
                  rowContainer(
                      text: 'Video Call',
                      icons: Icons.video_call,
                      colors: const Color.fromARGB(255, 113, 129, 248)),
                  rowContainer(
                      text: 'Message',
                      icons: Icons.message,
                      colors: const Color.fromARGB(255, 243, 175, 74)),
                ],
              ),
              Gap(15),
              textDemo(
                  text: 'Medicine & Heart Spelist',
                  fontwight: FontWeight.bold,
                  fontsized: 18),
              textDemo(
                  text: 'Good Health Clinic,MBBS,FCPS',
                  fontwight: FontWeight.bold,
                  colors: Colors.black45,
                  fontsized: 15),
              Gap(10),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                ],
              ),
              Gap(20),
              textDemo(
                  text: 'About Rihan',
                  fontwight: FontWeight.bold,
                  colors: Colors.black87,
                  fontsized: 18),
              textDemo(
                  text:
                      'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp',
                  colors: Colors.black87),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  columnText(name: 'Patients', num: '1.08k'),
                  columnText(name: 'Experience', num: '8 Years'),
                  columnText(name: 'Reviews', num: '2.05k'),
                ],
              ),
              Gap(35),
              eleButuonForView(
                callbaack: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AppoinmentRegister())),
                text: 'Book an Appoinment',
              )
            ],
          ),
        ),
      ),
    );
  }
}
