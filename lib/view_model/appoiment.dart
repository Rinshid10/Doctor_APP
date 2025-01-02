import 'dart:developer';

import 'package:doctor_app/model/Appoiment/appoiment.dart';
import 'package:doctor_app/services/UserServices/AppoimentServices/appoimentservices.dart';
import 'package:flutter/material.dart';

class AppoimentProvider extends ChangeNotifier {
  Appoimentservices ser = Appoimentservices();
  List<AppoimentForUser> listOfAppoiment = [];

  addAppoiment(AppoimentForUser model) async {
    try {
      await ser.addAppoiment(model);
    } catch (e) {
      log('error to add appoimnet');
    }
  }

  getallAppoiment() async {
    try {
      listOfAppoiment = await ser.getAllAppoiment();
      log(' lsit count  ${listOfAppoiment.length.toString()}');
      notifyListeners();
    } catch (e) {
      log('$e');
    }
  }
}
