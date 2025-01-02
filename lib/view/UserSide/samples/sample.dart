// import 'package:doctor_app/model/AddDoctors/adddoctors.dart';
// import 'package:doctor_app/view/UserSide/widgets/ReUse/widgets.dart';
// import 'package:doctor_app/view_model/addDcProvider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class Samples extends StatelessWidget {
//   Samples({super.key});
//   TextEditingController doctorName = TextEditingController();
//   TextEditingController doctorExperiance = TextEditingController();
//   TextEditingController doctorPatinents = TextEditingController();
//   TextEditingController doctorSpecilist = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.only(left: 30, right: 30, top: 90),
//         child: Consumer<Adddcprovider>(
//           builder: (context, value, child) => Column(
//             spacing: 40,
//             children: [
//               TextField(controller: doctorName),
//               TextField(
//                 controller: doctorExperiance,
//               ),
//               TextField(
//                 controller: doctorPatinents,
//               ),
//               TextField(
//                 controller: doctorSpecilist,
//               ),
//               eleButuonFoR(
//                   voids: () {
//                     final save = AdddoctorsModel(

//                         doctorExperiance: doctorExperiance.text,
//                         doctorName: doctorName.text,
//                         doctorPatinents: doctorPatinents.text,
//                         doctorSpecilist: doctorSpecilist.text);

//                     value.addData(save);
//                   },
//                   text: 'fdfdfdf')
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
