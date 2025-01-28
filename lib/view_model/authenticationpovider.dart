import 'dart:developer';

import 'package:doctor_app/model/authmodel/auth.dart';
import 'package:doctor_app/services/UserServices/Authentication/firebaseauthentication.dart';
import 'package:doctor_app/services/UserServices/Authentication/supabaseauth.dart';
import 'package:doctor_app/view/User/bottomNavigationbar/bottombar.dart';
import 'package:doctor_app/view/User/loginAndSignUP/LoginPage/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Authenticationpovider extends ChangeNotifier {
  Firebaseauthentication ser = Firebaseauthentication();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController phonenumber = TextEditingController();

  Loginservices supLogin = Loginservices();

  String usernameOFuser = '';
  List<bool> isveryfied = [];
  List<bool> isNotVeryfied = [];

  isEMail() async {
    try {
      isNotVeryfied = ser.ifFalse;
      isveryfied = ser.ifTrue;
      log(' length of isnotverified ${isNotVeryfied.length}  length of isVerified ${isveryfied.length}');
    } catch (e) {
      log('$e');
    }
  }

  supBaseRegister() async {
    try {
      await supLogin.register(password.text, email.text);
      log('Supbse register succes');
    } catch (e) {
      log('error inn supabase register $e');
    }
  }

  loginSupaBase(email, password) async {
    try {
      await supLogin.login(password, email);
      log('Supbse login succes');
    } catch (e) {
      log('error in supabase register');
    }
  }

  void register(BuildContext context) async {
    var now = DateTime.now();
    var a = DateFormat('EEEE');
    var b = DateFormat('MM-dd-yyyy');
    log(a.format(now));
    String dates = '${a.format(now)} / ${b.format(now)}';
    log(dates);
    notifyListeners();

    try {
      final save = Userdetailsmodels(
          email: email.text,
          phonenumber: phonenumber.text,
          username: username.text);
      await ser.register(
          model: save,
          emails: email.text,
          password: password.text,
          phonenumber: phonenumber.text,
          username: username.text);
      usernameOFuser = ser.username;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Navigationpage()));

      notifyListeners();
    } catch (e) {
      log('error found');
    }
  }

  void login(
      {required String emails,
      required String password,
      required BuildContext context}) async {
    await ser.login(emails: emails, password: password, context: context);
    notifyListeners();
  }
}
