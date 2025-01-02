import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view/UserSide/widgets/ReUse/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Widget carosilForHome() {
  return CarouselSlider(
    items: carosil.map((item) => Center(child: item)).toList(),
    options: CarouselOptions(
      enlargeCenterPage: true,
      autoPlay: true,
      autoPlayCurve: Curves.fastOutSlowIn,
      enableInfiniteScroll: true,
      viewportFraction: 1,
    ),
  );
}

Widget carosilContainer({required Color? colors}) {
  return Container(
    decoration:
        BoxDecoration(color: colors, borderRadius: BorderRadius.circular(10)),
    height: 180,
    width: double.infinity,
  );
}

List carosil = [
  carosilContainer(colors: Colors.red),
  carosilContainer(colors: Colors.amber),
  carosilContainer(colors: Colors.black12),
];
Widget categoriesContainer({required String name, required String image}) {
  return Container(
    height: 100,
    width: 100,
    decoration: BoxDecoration(
        color: ColorsConstents.witeColor,
        borderRadius: BorderRadius.circular(10)),
    child: Column(
      children: [
        SizedBox(
          child: Container(
            margin: EdgeInsets.only(top: 15),
            height: 40,
            width: 60,
            child: Image(image: AssetImage(image)),
          ),
        ),
        Gap(5),
        textDemo(text: name, fontwight: FontWeight.bold, colors: Colors.black)
      ],
    ),
  );
}

Widget carosilForDoctors() {
  return CarouselSlider(
    items: docotorList.map((item) => Center(child: item)).toList(),
    options: CarouselOptions(
      enlargeCenterPage: true,
      autoPlay: true,
      autoPlayCurve: Curves.fastOutSlowIn,
      enableInfiniteScroll: true,
      viewportFraction: 1,
    ),
  );
}

List docotorList = [
  doctorContainer(text: '10'),
  doctorContainer(text: '11'),
  doctorContainer(text: '13'),
];

Widget doctorContainer({required String text}) {
  return Container(
    height: 220,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: ColorsConstents.witeColor,
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(12),
              textDemo(
                  text: 'Dr. Serena Gome',
                  fontsized: 18,
                  fontwight: FontWeight.bold),
              textDemo(
                text: 'Medicine Specialist',
                fontsized: 15,
              ),
              Gap(10),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 15),
                  Icon(Icons.star, color: Colors.yellow, size: 15),
                  Icon(Icons.star, color: Colors.yellow, size: 15),
                  Icon(Icons.star, color: Colors.yellow, size: 15),
                ],
              ),
              Gap(15),
              textDemo(
                  text: 'Experiance',
                  fontwight: FontWeight.bold,
                  colors: Colors.black54),
              textDemo(
                  text: '8 Years',
                  fontwight: FontWeight.w800,
                  colors: Colors.black),
              Gap(10),
              textDemo(
                  text: 'Patients',
                  fontwight: FontWeight.bold,
                  colors: Colors.black54),
              textDemo(
                  text: '${text}.08k',
                  fontwight: FontWeight.w800,
                  colors: Colors.black),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Container(
              height: double.infinity,
              width: 150,
              child: Image(image: AssetImage('asset/doctor_image.png')),
            ),
          )
        ],
      ),
    ),
  );
}
