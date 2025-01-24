import 'package:doctor_app/utils/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Widget textDemo(
    {required String text,
    double? fontsized,
    FontWeight? fontwight,
    Color? colors}) {
  return Text(
    text,
    style: TextStyle(fontWeight: fontwight, fontSize: fontsized, color: colors),
  );
}

Widget eleButuonForLR({ 
  VoidCallback? voidfuc,
}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: ColorsConstents.buttonColors),
      onPressed: voidfuc,
      child: textDemo(
          text: 'Login',
          fontsized: 20,
          fontwight: FontWeight.bold,
          colors: ColorsConstents.textWhiteColor));
}
Widget eleButuonFoR({
  required VoidCallback voids,
  required String text,
}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: ColorsConstents.buttonColors),
      onPressed: voids,
      child: textDemo(
          text: text,     
          fontsized: 20,
          fontwight: FontWeight.bold,
          colors: ColorsConstents.textWhiteColor));
}

Widget eleButuon({VoidCallback? voidfuc, required child}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: ColorsConstents.buttonColors),
      onPressed: voidfuc,
      child: child);
}
       

Widget containerGoogle() {
  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(                                                                    
        border: Border.all(color: ColorsConstents.buttonColors),
        color: ColorsConstents.backGroundColor,
        borderRadius: BorderRadius.circular(5)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: double.infinity,
          width: 50,
          color: Colors.red,
        ),
        Gap(15),
        textDemo(
            text: 'Sign with Google', fontsized: 18, fontwight: FontWeight.bold)
      ],
    ),
  );
}
