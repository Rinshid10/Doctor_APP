import 'dart:developer';

import 'package:doctor_app/model/userDetails/userdetailsmodel.dart';
import 'package:doctor_app/services/Admin/userData/userservisesinadmin.dart';
import 'package:flutter/material.dart';

class Userdetailsprovider extends ChangeNotifier {
  Userservisesinadmin ser = Userservisesinadmin();
  List<Userdetailsmodel> listUserData = [];

  getAllUserDetails() async {
    try {
      listUserData = await ser.getAlluser();
      log('succes to add data to list ${listUserData.length}');
      notifyListeners();
    } catch (e) {
      log('$e');
    }
  }
}
