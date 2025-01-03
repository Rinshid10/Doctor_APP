import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/view/Admin/AdminHomepage/adminhomepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminloginServices {
  FirebaseAuth store = FirebaseAuth.instance;
  CollectionReference storeAdmin =
      FirebaseFirestore.instance.collection('AdminDetails');
  bool adminLoginss = false;

  Future adminISlOginOrNot() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        log('user logined');
      } else {
        log('user didint login');
      }
    } catch (e) {
      log('$e');
    }
  }

  Future adminLogin(
      {required email,
      required password,
      required BuildContext context}) async {
    try {
      DocumentSnapshot details = await storeAdmin.doc('aboutAdming').get();

      String? adminEmail = details['email'];
      String? adminPaswword = details['password'];

      await store.signInWithEmailAndPassword(email: email, password: password);
      if (email == adminEmail && password == adminPaswword) {
        await Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Adminhomepage()));
        adminLoginss = true;
        log('suuces to admin login');
      } else {
        adminLoginss = false;
        log('didint login by admin');
      }
    } catch (e) {
      log('${e}');
    }
  }
}
