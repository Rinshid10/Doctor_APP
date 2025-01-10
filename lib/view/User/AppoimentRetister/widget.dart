import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view/User/widgets/ReUse/widgets.dart';
import 'package:doctor_app/view/User/widgets/ReUse/widgets.dart';
import 'package:flutter/material.dart';

// Widget slotContainer(BuildContext context, String slot, String? selectedSlot,
//     VoidCallback onTap) {
//   return GestureDetector(
//     onTap: onTap,
//     child: Container(
//       height: 50,
//       width: 120,
//       decoration: BoxDecoration(
//         color: selectedSlot == slot ? Colors.blue : Colors.green,
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Center(
//         child: textDemo(
//           text: slot,
//           colors: ColorsConstents.witeColor,
//           fontwight: FontWeight.bold,
//         ),
//       ),
//     ),
//   );
// }
List<String> timeSlots = [
  '10:10 am',
  '10:30 am',
  '11:15 am',
  '11:50 am',
  '2:00 pm',
  '2:50 pm',
];

Widget slotContainer(
    {BuildContext? context,
    required int index,
    required int selectedSlot,
    required onTap,
    required String texts}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 50,
      width: 120,
      decoration: BoxDecoration(
        color: selectedSlot == index
            ? ColorsConstents.buttonColors
            : ColorsConstents.witeColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          texts,
          style: TextStyle(
            color: selectedSlot == index
                ? ColorsConstents.witeColor
                : ColorsConstents.textBlackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

Widget eleButuonForAppoient({required text, required VoidCallback callback}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: ColorsConstents.buttonColors),
      onPressed: callback,
      child: textDemo(
          text: text,
          fontsized: 18,
          fontwight: FontWeight.bold,
          colors: ColorsConstents.textWhiteColor));
}
