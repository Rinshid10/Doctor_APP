import 'dart:developer';
import 'dart:ui';
import 'package:doctor_app/model/Appoiment/appoiment.dart';
import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view/User/AnimationJson/BookedSlot/bookedsloat.dart';
import 'package:doctor_app/view/User/AppoimentRetister/widget.dart';
import 'package:doctor_app/view/User/widgets/ReUse/widgets.dart';
import 'package:doctor_app/view_model/appoiment.dart';
import 'package:doctor_app/view_model/datepicker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AppoinmentRegister extends StatelessWidget {
  String? doctorName;
  String? specialist;
  String? experiance;
  String? patients;
  AppoinmentRegister(
      {super.key,
      this.doctorName,
      this.experiance,
      this.patients,
      this.specialist});
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstents.backGroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: textDemo(
          text: 'Appointment',
          fontsized: 20,
          fontwight: FontWeight.bold,
        ),
      ),
      body: Consumer2<DateProvider, AppoimentProvider>(
        builder: (context, dateProvider, appoimentPr, child) => Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(10),
                SizedBox(
                    height: 170,
                    width: double.infinity,
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 12),
                                textDemo(
                                  text: '$doctorName' ?? 'no name',
                                  fontsized: 15,
                                  fontwight: FontWeight.bold,
                                ),
                                textDemo(
                                  text: '$specialist' ?? 'no specilist',
                                  fontsized: 12,
                                ),
                                Gap(3),
                                Row(
                                  children: List.generate(
                                    4,
                                    (index) => Icon(Icons.star,
                                        color: Colors.yellow, size: 14),
                                  ),
                                ),
                                Gap(3),
                                textDemo(
                                  text: 'Experience',
                                  fontwight: FontWeight.bold,
                                  fontsized: 13,
                                  colors: Colors.black54,
                                ),
                                textDemo(
                                  text: '$experiance years',
                                  fontwight: FontWeight.w800,
                                  fontsized: 12,
                                  colors: Colors.black,
                                ),
                                Gap(3),
                                textDemo(
                                  text: 'Patients',
                                  fontwight: FontWeight.bold,
                                  colors: Colors.black54,
                                ),
                                textDemo(
                                  text: '$patients',
                                  fontwight: FontWeight.w800,
                                  fontsized: 8,
                                  colors: Colors.black,
                                ),
                              ],
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, bottom: 20, right: 10),
                              child: SizedBox(
                                height: double.infinity,
                                width: 90,
                                child: Image(
                                    image:
                                        AssetImage('asset/doctor_image.png')),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                Gap(20),
                Row(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsConstents.buttonColors,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        onPressed: () async {
                          final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: dateProvider.selectedDate,
                            firstDate: DateTime(2025),
                            lastDate: DateTime(2026),
                          );

                          if (pickedDate != null &&
                              pickedDate != dateProvider.selectedDate) {
                            dateProvider.setSelectedDate(pickedDate);
                            dateProvider.pickdateDay = pickedDate.day;
                            dateProvider.pickdateMonth = pickedDate.month;
                            dateProvider.selectedDateInDay =
                                formatDate(pickedDate);
                          }
                        },
                        child: textDemo(
                            text: 'Select Date ', colors: Colors.white)),
                    Spacer(),
                    textDemo(
                        text: dateProvider.selectedDateInDay != null
                            ? '${dateProvider.selectedDateInDay}'
                            : 'No date Selected',
                        fontwight: FontWeight.bold,
                        fontsized: 18)
                  ],
                ),
                Gap(20),
                textDemo(
                  text: 'Slots',
                  fontsized: 20,
                  fontwight: FontWeight.bold,
                ),
                SizedBox(
                  height: 120,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.7,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: timeSlots.length,
                    itemBuilder: (context, index) {
                      return slotContainer(
                        index: index,
                        selectedSlot: dateProvider.selectedSlot,
                        onTap: () {
                          dateProvider.setSelectedSlot(index);
                        },
                        texts: timeSlots[index],
                      );
                    },
                  ),
                ),
                textDemo(
                    text: dateProvider.selectedSlot != null
                        ? "Booked at  ${dateProvider.selectedDateInDay} At ${dateProvider.selectedTime} "
                        : 'No Time Selected ',
                    fontwight: FontWeight.bold,
                    fontsized: 17),
                Gap(20),
                eleButuonForAppoient(
                    text: 'Confirm Appointment',
                    callback: () {
                      showDialog(
                        context: context,
                        builder: (context) => Stack(
                          children: [
                            BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                              child: Container(
                                color: Colors.white.withAlpha(100),
                              ),
                            ),
                            Center(
                              child: AlertDialog(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                title: textfeildInAlerDilog(
                                    controller: name,
                                    text: 'Enter the patient name'),
                                content: textfeildInAlerDilog(
                                    controller: age,
                                    text: 'Enter the patinent age'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(color: Colors.redAccent),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      final save = AppoimentForUser(
                                          patientName: name.text,
                                          patinentAge: age.text,
                                          doctorName: doctorName,
                                          month: dateProvider.monthFixed,
                                          date: dateProvider.pickdateDay,
                                          day: dateProvider.selectedDateInDay,
                                          time: dateProvider.selectedTime);

                                      appoimentPr.addAppoiment(
                                          model: save, context: context);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Bookedsloat()));
                                    },
                                    child: Text('Save'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  String formatDate(DateTime dateTime) {
    String dayOfWeek = _getDayOfWeek(dateTime.weekday);
    String date = "${dateTime.day.toString()}";

    return "  $dayOfWeek";
  }

  String _getDayOfWeek(int weekday) {
    switch (weekday) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      case 7:
        return "Sunday";
      default:
        return "";
    }
  }
}
