import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view/User/MyAppoiment/widget.dart';
import 'package:doctor_app/view/User/widgets/ReUse/widgets.dart';
import 'package:doctor_app/view_model/appoiment.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Adminappoiment extends StatefulWidget {
  const Adminappoiment({super.key});

  @override
  State<Adminappoiment> createState() => _AdminappoimentState();
}

class _AdminappoimentState extends State<Adminappoiment> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AppoimentProvider>(context, listen: false).adminappoimentGet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstents.backGroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: textDemo(
          text: "All Appointment",
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
            itemCount: value.listOfAppoimentFOrAdmin.length,
            itemBuilder: (context, index) {
              final datas = value.listOfAppoimentFOrAdmin[index];
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorsConstents.textWhiteColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        height: 70,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textDemo(text: 'Name :'),
                            textDemo(text: 'phone:'),
                            textDemo(text: 'email:'),
                          ],
                        ),
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          rowColoumn(head: 'date', headORdate: '${datas.date}'),
                          rowColoumn(head: 'Time', headORdate: '${datas.time}'),
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
                      Gap(15),
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
