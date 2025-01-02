import 'dart:developer';
import 'package:doctor_app/services/AdminLogin/adminlogin.dart';
import 'package:doctor_app/view/Admin/AdminHomepage/adminhomepage.dart';
import 'package:flutter/material.dart';

class Adminlogin extends ChangeNotifier {
  AdminloginServices ser = AdminloginServices();
  bool cheackAdmin = false;

  adminAlredyLogin(BuildContext context) async {
    try {
      await ser.adminISlOginOrNot();

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Adminhomepage()));
    } catch (e) {
      log('$e');
    }
  }

  adminLoginPage(String email, String password, BuildContext context) async {
    try {
      cheackAdmin = true;
      notifyListeners();
      await ser.adminLogin(email: email, password: password, context: context);

      notifyListeners();
    } catch (e) {
      cheackAdmin = false;
      log('$e');
    } finally {
      cheackAdmin = false;
      notifyListeners();
    }
  }
}
