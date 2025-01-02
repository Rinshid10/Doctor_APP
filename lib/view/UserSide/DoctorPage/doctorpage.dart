import 'dart:developer';

import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view/UserSide/DoctorPage/widget.dart';
import 'package:doctor_app/view/UserSide/widgets/ReUse/widgets.dart';
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
    // TODO: implement initState
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
              textDemo(
                  text: 'Available', fontsized: 15, fontwight: FontWeight.bold),
              Row(
                children: [
                  textDemo(
                      text: 'Specialist',
                      fontsized: 25,
                      fontwight: FontWeight.w900),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  IconButton(
                      onPressed: () {
                        value.getData();
                        log('taped');
                      },
                      icon: Icon(CupertinoIcons.chat_bubble)),
                ],
              ),
              Gap(20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 1.1),
                  itemCount: value.listDoctor.length,
                  itemBuilder: (context, index) {
                    return doctorContainerSInViewPage(
                        context: context, data: value.listDoctor[index]);
                  },
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
