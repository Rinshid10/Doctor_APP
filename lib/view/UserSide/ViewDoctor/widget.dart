import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view/UserSide/widgets/ReUse/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget rowContainer(
    {required String text, required IconData icons, required Color colors}) {
  return Container(
    height: 50,
    width: 110,
    decoration:
        BoxDecoration(color: colors, borderRadius: BorderRadius.circular(5)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          icons,
          color: ColorsConstents.witeColor,
        ),
        textDemo(
          text: text,
          fontwight: FontWeight.bold,
          colors: ColorsConstents.witeColor,
        ),
      ],
    ),
  );
}

Widget columnText({required String name, required String num}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      textDemo(
          text: name,
          fontwight: FontWeight.bold,
          colors: Colors.black54,
          fontsized: 15),
      textDemo(
          text: num,
          fontwight: FontWeight.bold,
          colors: Colors.black87,
          fontsized: 18),
    ],
  );
}

Widget eleButuonForView({required text, required VoidCallback callbaack}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: ColorsConstents.buttonColors),
      onPressed: callbaack,
      child: textDemo(
          text: text,
          fontsized: 18,
          fontwight: FontWeight.bold,
          colors: ColorsConstents.textWhiteColor));
}
