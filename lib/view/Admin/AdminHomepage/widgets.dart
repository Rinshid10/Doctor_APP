import 'package:doctor_app/view/User/widgets/ReUse/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Widget cont(
    {required Color colors,
    required String name,
    required String another,
    required callback}) {
  return GestureDetector(
      onTap: callback,
      child: Card(
          elevation: 3,
          child: Container(
              height: 150,
              decoration: BoxDecoration(
                  color: colors, borderRadius: BorderRadius.circular(10)),
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
                        Row(children: [
                          textDemo(
                              text: 'Tap to view',
                              fontwight: FontWeight.bold,
                              colors: Colors.white,
                              fontsized: 15),
                          Icon(Icons.arrow_right, color: Colors.white, size: 30)
                        ])
                      ])))));
}

Widget detaialsCard({required Color colors, required String text}) {
  return Card(
      elevation: 1,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Card(
                color: colors,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: SizedBox(
                    height: 60,
                    width: 60,
                    child: Icon(Icons.dashboard, color: Colors.white))),
            Gap(10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              textDemo(fontsized: 16, text: text, fontwight: FontWeight.bold),
              SizedBox(width: 200, child: Divider(thickness: 5, color: colors))
            ])
          ])));
}
