import 'package:doctor_app/view/UserSide/widgets/ReUse/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Widget cont(
    {required Color colors,
    required String name,
    required String another,
    required callback}) {
  return GestureDetector(
    onTap: callback,
    child: Container(
      height: 150,
      decoration:
          BoxDecoration(color: colors, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(20),
            textDemo(
                text: name,
                fontsized: 15,
                fontwight: FontWeight.bold,
                colors: Colors.white),
            Gap(15),
            textDemo(
                text: another,
                fontwight: FontWeight.bold,
                colors: Colors.white,
                fontsized: 20),
            Gap(20),
            Row(
              children: [
                textDemo(
                    text: 'Tap to view',
                    fontwight: FontWeight.bold,
                    colors: Colors.white,
                    fontsized: 15),
                Icon(Icons.arrow_right, color: Colors.white, size: 30)
              ],
            )
          ],
        ),
      ),
    ),
  );
}
