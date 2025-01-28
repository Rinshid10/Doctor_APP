// import 'dart:developer';

// import 'package:doctor_app/utils/colors/colors.dart';
// import 'package:doctor_app/view/User/DoctorPage/widget.dart';
// import 'package:doctor_app/view/User/widgets/ReUse/widgets.dart';
// import 'package:doctor_app/view_model/addDcProvider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:provider/provider.dart';

// class Doctorpage extends StatefulWidget {
//   const Doctorpage({super.key});

//   @override
//   State<Doctorpage> createState() => _DoctorpageState();
// }

// class _DoctorpageState extends State<Doctorpage> {
//   @override
//   void initState() {
//     super.initState();
//     Provider.of<Adddcprovider>(context, listen: false).getData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<Adddcprovider>(
//       builder: (context, value, child) => Scaffold(
//         backgroundColor: ColorsConstents.backGroundColor,
//         body: SafeArea(
//             child: Padding(
//           padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               textDemo(
//                   text: 'Available', fontsized: 15, fontwight: FontWeight.bold),
//               Row(
//                 children: [
//                   textDemo(
//                       text: 'Specialist',
//                       fontsized: 25,
//                       fontwight: FontWeight.w900),
//                   Spacer(),
//                   IconButton(onPressed: () {}, icon: Icon(Icons.search)),
//                   IconButton(
//                       onPressed: () {
//                         value.getData();
//                         log('taped');
//                       },
//                       icon: Icon(CupertinoIcons.chat_bubble)),
//                 ],
//               ),
//               Gap(20),
//               Expanded(
//                 child: GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       mainAxisSpacing: 3,
//                       crossAxisSpacing: 10,
//                       childAspectRatio: 1.10),
//                   itemCount: value.listDoctor.length,
//                   itemBuilder: (context, index) {
//                     if (value.listDoctor.isEmpty) {
//                       return Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }
//                     return doctorContainerSInViewPage(
//                         context: context, data: value.listDoctor[index]);
//                   },
//                 ),
//               ),
//             ],
//           ),
//         )),
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view/User/DoctorPage/widget.dart';
import 'package:doctor_app/view/User/widgets/ReUse/widgets.dart';
import 'package:doctor_app/view_model/addDcProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Doctorpage extends StatefulWidget {
  const Doctorpage({super.key});

  @override
  State<Doctorpage> createState() => _DoctorpageState();
}

class _DoctorpageState extends State<Doctorpage> {
  @override
  void initState() {
    super.initState();
    Provider.of<Adddcprovider>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Adddcprovider>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: ColorsConstents.backGroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title text
                textDemo(
                  text: 'Available',
                  fontsized: 15,
                  fontwight: FontWeight.bold,
                ),
                Row(
                  children: [
                    textDemo(
                      text: 'Specialist',
                      fontsized: 25,
                      fontwight: FontWeight.w900,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search),
                    ),
                    IconButton(
                      onPressed: () {
                        value.getData();
                        log('Tapped');
                      },
                      icon: const Icon(CupertinoIcons.chat_bubble),
                    ),
                  ],
                ),
                const Gap(20),
                Expanded(
                  child: value.listDoctor.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.9,
                          ),
                          itemCount: value.listDoctor.length,
                          itemBuilder: (context, index) {
                            return doctorContainerSInViewPage(
                              context: context,
                              data: value.listDoctor[index],
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
