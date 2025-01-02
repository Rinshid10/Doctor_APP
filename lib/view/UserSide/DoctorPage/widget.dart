import 'package:doctor_app/model/AddDoctors/adddoctors.dart';
import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view/UserSide/ViewDoctor/doctorviewpage.dart';
import 'package:doctor_app/view/UserSide/widgets/ReUse/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// List doctorContainerList = [
//   doctorContainerSInViewPage(text: '124'),
//   doctorContainerSInViewPage(text: '124'),
//   doctorContainerSInViewPage(text: '134'),
//   doctorContainerSInViewPage(text: '144'),
//   doctorContainerSInViewPage(text: '124'),
//   doctorContainerSInViewPage(text: '154'),
//   doctorContainerSInViewPage(text: '124'),
//   doctorContainerSInViewPage(text: '124'),
//   doctorContainerSInViewPage(text: '124'),
//   doctorContainerSInViewPage(text: '124'),
//   doctorContainerSInViewPage(text: '124'),
//   doctorContainerSInViewPage(text: '124'),
//   doctorContainerSInViewPage(text: '124'),
// ];
// Widget doctorContainerSInViewPage(  { required AdddoctorsModel  data}) {

//   return Container(

//     height: 170,
//     width: 170,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(10),
//       color: ColorsConstents.witeColor,
//     ),
//     child: Padding(
//       padding: const EdgeInsets.only(left: 10, right: 0),
//       child: Row(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Gap(12),
//               textDemo(
//                   text: 'Dr. Serena Gome',
//                   fontsized: 10,
//                   fontwight: FontWeight.bold),
//               textDemo(
//                 text: 'Medicine Specialist',
//                 fontsized: 8,
//               ),
//               Gap(10),
//               Row(
//                 children: [
//                   Icon(Icons.star, color: Colors.yellow, size: 10),
//                   Icon(Icons.star, color: Colors.yellow, size: 10),
//                   Icon(Icons.star, color: Colors.yellow, size: 10),
//                   Icon(Icons.star, color: Colors.yellow, size: 10),
//                 ],
//               ),
//               Gap(10),
//               textDemo(
//                   text: 'Experiance',
//                   fontwight: FontWeight.bold,
//                   fontsized: 10,
//                   colors: Colors.black54),
//               textDemo(
//                   text: '8',
//                   fontwight: FontWeight.w800,
//                   fontsized: 10,
//                   colors: Colors.black),
//               Gap(10),
//               textDemo(
//                   text: 'Patients',
//                   fontwight: FontWeight.bold,
//                   colors: Colors.black54),
//               textDemo(
//                   text: '${text}.08k',
//                   fontwight: FontWeight.w800,
//                   fontsized: 8,
//                   colors: Colors.black),
//             ],
//           ),
//           Spacer(),
//           Padding(
//             padding: const EdgeInsets.only(top: 20, bottom: 20, right: 10),
//             child: Container(
//               height: double.infinity,
//               // width: 30,
//               child: Image(image: AssetImage('asset/doctor_image.png')),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
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
        color: Colors.white, // Adjust the color as needed
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
                width: 50,
                child: Image(image: AssetImage('asset/doctor_image.png')),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
