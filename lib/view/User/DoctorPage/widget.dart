import 'dart:io';

import 'package:doctor_app/model/AddDoctors/adddoctors.dart';
import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view/User/ViewDoctor/doctorviewpage.dart';
import 'package:doctor_app/view/User/widgets/ReUse/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Widget doctorContainerSInViewPage(
    {required AdddoctorsModel data, required BuildContext context}) {
  return GestureDetector(
    onTap: () => Navigator.push(
        context, MaterialPageRoute(builder: (context) => Doctorviewpage())),
    child: Container(
      height: 170,
      width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12),
                textDemo(
                  text: data.doctorName ?? 'no name',
                  fontsized: 10,
                  fontwight: FontWeight.bold,
                ),
                textDemo(
                  text: data.doctorSpecilist ?? 'no specilist',
                  fontsized: 8,
                ),
                SizedBox(height: 10),
                Row(
                  children: List.generate(
                    4,
                    (index) => Icon(Icons.star, color: Colors.yellow, size: 10),
                  ),
                ),
                SizedBox(height: 10),
                textDemo(
                  text: 'Experience',
                  fontwight: FontWeight.bold,
                  fontsized: 10,
                  colors: Colors.black54,
                ),
                textDemo(
                  text: '${data.doctorExperiance} years',
                  fontwight: FontWeight.w800,
                  fontsized: 10,
                  colors: Colors.black,
                ),
                SizedBox(height: 10),
                textDemo(
                  text: 'Patients',
                  fontwight: FontWeight.bold,
                  colors: Colors.black54,
                ),
                textDemo(
                  text: '${data.doctorPatinents}.08k',
                  fontwight: FontWeight.w800,
                  fontsized: 8,
                  colors: Colors.black,
                ),
              ],
            ),
            Spacer(),
            Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20, right: 10),
                child: SizedBox(
                    height: double.infinity,
                    width: 100,
                    child: Image(
                      image: FileImage(File(data.images!)),
                    ))),
          ],
        ),
      ),
    ),
  );
}
