import 'dart:developer';

import 'package:doctor_app/model/AddDoctors/adddoctors.dart';
import 'package:doctor_app/services/UserServices/AddingDoctor/addingdoctor.dart';
import 'package:flutter/material.dart';

class Adddcprovider extends ChangeNotifier {
  AddingdoctorServices ser = AddingdoctorServices();
  List<AdddoctorsModel> listDoctor = [];

  getData() async {
    listDoctor = await ser.getDataFromFireBase();
    if (listDoctor.isNotEmpty) {
      log("data get success");
      log(listDoctor.length.toString());
    }

    notifyListeners();
  }

  addData(AdddoctorsModel model) async {
    await ser.addDoctor(model);
    notifyListeners();
  }
}
