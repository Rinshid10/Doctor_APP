import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view/User/AppoimentRetister/appoinmentRegester.dart';
import 'package:doctor_app/view/User/ViewDoctor/widget.dart';
import 'package:doctor_app/view/User/widgets/ReUse/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Doctorviewpage extends StatelessWidget {
  String? name;
  String? cat;
  var image;
  String? qali;
  String? about;
  String? exp;
  String? pat;
  Doctorviewpage({
    super.key,
    required this.about,
    required this.cat,
    required this.exp,
    required this.name,
    required this.qali,
    required this.image,
    required this.pat,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstents.backGroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: textDemo(
            text: name ?? 'no name', fontwight: FontWeight.bold, fontsized: 20),
        backgroundColor: ColorsConstents.textWhiteColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                child: Center(child: Image.network(image)),
              ),
              Gap(15),
              textDemo(
                  text: qali ?? 'no qa',
                  fontwight: FontWeight.bold,
                  fontsized: 18),
              textDemo(
                  text: 'Good Health Clinic,MBBS,FCPS',
                  fontwight: FontWeight.bold,
                  colors: Colors.black45,
                  fontsized: 15),
              Gap(10),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                ],
              ),
              Gap(20),
              textDemo(
                  text: 'About $name',
                  fontwight: FontWeight.bold,
                  colors: Colors.black87,
                  fontsized: 18),
              textDemo(text: about ?? 'no ', colors: Colors.black87),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  columnText(name: 'Patients', num: '${pat}k'),
                  columnText(name: 'Experience', num: '$exp Years'),
                  columnText(name: 'Reviews', num: '2.05k'),
                ],
              ),
              Gap(50),
              eleButuonForView(
                callbaack: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AppoinmentRegister())),
                text: 'Book an Appoinment',
              )
            ],
          ),
        ),
      ),
    );
  }
}
