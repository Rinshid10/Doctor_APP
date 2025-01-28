import 'dart:developer';
import 'dart:io';
import 'package:doctor_app/model/AddDoctors/adddoctors.dart';
import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view/Admin/view_model/dropdown.dart';
import 'package:doctor_app/view/User/widgets/ReUse/widgets.dart';
import 'package:doctor_app/view_model/addDcProvider.dart';
import 'package:doctor_app/view_model/imagepicker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class AdddoctorInAdmin extends StatelessWidget {
  AdddoctorInAdmin({super.key});
  TextEditingController nameOfdoctor = TextEditingController();
  TextEditingController specilalist = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController patients = TextEditingController();
  TextEditingController about = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstents.backGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer3<DropdownAdmin, Adddcprovider, ImageControllerss>(
            builder: (context, value, addDoctor, imageProviders, child) =>
                Column(
              spacing: 30,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 170,
                      width: double.infinity,
                      color: ColorsConstents.buttonColors,
                    ),
                    Positioned(
                        bottom: -40,
                        left: 0,
                        right: 0,
                        child: GestureDetector(
                            onTap: () => imageProviders.pickImage(),
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                  radius: 55,
                                  backgroundColor: ColorsConstents.buttonColors,
                                  child: imageProviders.imageFile != null
                                      ? ClipOval(
                                          child: Image(
                                            image: FileImage(
                                                imageProviders.imageFile!),
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : Icon(
                                          Icons.person,
                                          size: 40,
                                          color: Colors.white,
                                        )),
                            ))),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: ColorsConstents.witeColor,
                            size: 35,
                          )),
                    )
                  ],
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    spacing: 30,
                    children: [
                      textFieldsAddDoctor(
                          labeltext: 'Name of Doctor', contr: nameOfdoctor),
                      textFieldsAddDoctor(
                          labeltext: 'Specialist in', contr: specilalist),
                      DropdownButtonFormField<String>(
                          value: value.selectedCategory,
                          decoration: InputDecoration(
                              labelText: 'Categories',
                              border: OutlineInputBorder()),
                          onChanged: (String? newValue) {
                            value.changeValue(newValue);
                          },
                          items: value.categories
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                                value: value, child: Text(value));
                          }).toList()),
                      textFieldsAddDoctor(
                          contr: experience,
                          labeltext: 'Experiance',
                          kebordtype: TextInputType.number),
                      textFieldsAddDoctor(
                          contr: patients,
                          labeltext: 'Patients',
                          kebordtype: TextInputType.number),
                      textFieldsAddDoctor(
                          max: 3, contr: about, labeltext: 'About'),
                      eleButuonFoR(
                          voids: () {
                            imageProviders
                                .uplodImage(imageProviders.imageFile!);

                            final save = AdddoctorsModel(
                                images: imageProviders.data,
                                about: about.text,
                                categeries: value.selectedCategory,
                                doctorExperiance: experience.text,
                                doctorName: nameOfdoctor.text,
                                doctorPatinents: patients.text,
                                doctorSpecilist: specilalist.text);
                            addDoctor.addData(save);
                          },
                          text: 'Add'),
                      Gap(30),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget textFieldsAddDoctor(
    {required String labeltext,
    TextInputType? kebordtype,
    int? max,
    TextEditingController? contr}) {
  return TextField(
    maxLines: max,
    controller: contr,
    keyboardType: kebordtype,
    decoration:
        InputDecoration(labelText: labeltext, border: OutlineInputBorder()),
  );
}
