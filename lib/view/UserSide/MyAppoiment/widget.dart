import 'package:doctor_app/view/UserSide/widgets/ReUse/widgets.dart';
import 'package:flutter/material.dart';

Widget rowColoumn({required String head, required String headORdate}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      textDemo(
          text: head,
          fontsized: 10,
          colors: Colors.black54,
          fontwight: FontWeight.bold),
      textDemo(text: headORdate, fontwight: FontWeight.bold)
    ],
  );
}
