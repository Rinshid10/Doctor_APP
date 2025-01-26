import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view/User/HomePage/widgets.dart';
import 'package:doctor_app/view/User/widgets/ReUse/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstents.backGroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textDemo(
                  text: 'Find Your', fontsized: 15, fontwight: FontWeight.bold),
              Row(
                children: [
                  textDemo(
                      text: 'Specialist',
                      fontsized: 25,
                      fontwight: FontWeight.bold),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  IconButton(
                      onPressed: () {}, icon: Icon(CupertinoIcons.chat_bubble)),
                ],
              ),
              carosilForHome(),
              Gap(10),
              Row(
                children: [
                  textDemo(
                      text: 'Categories',
                      fontsized: 17,
                      colors: Colors.black87,
                      fontwight: FontWeight.bold),
                  Spacer(),
                  textDemo(
                      text: 'See All',
                      fontsized: 15,
                      colors: Colors.black87,
                      fontwight: FontWeight.bold),
                ],
              ),
              Gap(20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 20,
                  children: [
                    categoriesContainer(
                        image: 'asset/Medicin_icon.jpg', name: 'Pediatrician'),
                    categoriesContainer(
                        image: 'asset/Medicin_icon.jpg', name: 'Pediatrician'),
                    categoriesContainer(
                        image: 'asset/Medicin_icon.jpg', name: 'Pediatrician'),
                    categoriesContainer(
                        image: 'asset/Medicin_icon.jpg', name: 'Pediatrician'),
                  ],
                ),
              ),
              Gap(25),
              Row(
                children: [
                  textDemo(
                      text: 'Available Doctor',
                      fontsized: 17,
                      colors: Colors.black87,
                      fontwight: FontWeight.bold),
                  Spacer(),
                  textDemo(
                      text: 'See All',
                      fontsized: 15,
                      colors: Colors.black87,
                      fontwight: FontWeight.bold),
                ],
              ),
              Gap(25),
              carosilForDoctors(),
            ],
          ),
        )),
      ),
    );
  }
}
