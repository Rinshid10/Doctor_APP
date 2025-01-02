import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view/UserSide/MyAppoiment/widget.dart';
import 'package:doctor_app/view/UserSide/widgets/ReUse/widgets.dart';
import 'package:doctor_app/view_model/appoiment.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Appoinmentpage extends StatefulWidget {
  const Appoinmentpage({super.key});

  @override
  State<Appoinmentpage> createState() => _AppoinmentpageState();
}

class _AppoinmentpageState extends State<Appoinmentpage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AppoimentProvider>(context, listen: false).getallAppoiment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstents.backGroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: textDemo(
          text: "My Appointment",
          colors: ColorsConstents.textBlackColor,
          fontsized: 20,
          fontwight: FontWeight.bold,
        ),
        backgroundColor: ColorsConstents.textWhiteColor,
      ),
      body: Consumer<AppoimentProvider>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: ListView.builder(
            itemCount: value.listOfAppoiment.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorsConstents.textWhiteColor,
                      borderRadius: BorderRadius.circular(10)),
                  height: 140,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          rowColoumn(head: 'date', headORdate: '12/34/3000'),
                          rowColoumn(head: 'Time', headORdate: '10:30 pm'),
                          rowColoumn(
                              head: 'Doctor', headORdate: 'Dr. adam Smit'),
                        ],
                      ),
                      Divider(
                        color: Colors.black12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          rowColoumn(head: 'Type', headORdate: 'Dentist'),
                          rowColoumn(head: 'Place', headORdate: 'City clinic'),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 30,
                                right: 30,
                                top: 10,
                                bottom: 10,
                              ),
                              child: textDemo(
                                text: 'Cancel',
                                colors: ColorsConstents.witeColor,
                                fontwight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
