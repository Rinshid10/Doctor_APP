import 'dart:developer';

import 'package:doctor_app/model/Appoiment/appoiment.dart';
import 'package:doctor_app/services/UserServices/AppoimentServices/appoimentservices.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppoimentProvider extends ChangeNotifier {
  Appoimentservices ser = Appoimentservices();
  List<AppoimentForUser> listOfAppoiment = [];
  List<AppoimentForUser> listOfAppoimentFOrAdmin = [];
  final monday = 'Monday';
  final tuesday = 'Tuesday';
  final wednesday = 'Wednesday';
  final thursday = 'Thursday';
  final friday = 'Friday';
  final saturday = 'Saturday';

  adminappoimentGet() async {
    try {
      listOfAppoimentFOrAdmin = await ser.getAllAppoimentForAdmin();

      notifyListeners();
    } catch (e) {
      log('error in admin app $e');
    }
  }

  addAppoiment(AppoimentForUser model) async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        model.userId = currentUser.uid;
        await ser.addAppoiment(model);
        notifyListeners();
        log('Appointment added for user: ${currentUser.uid}');
      } else {
        log('No user is logged in.');
      }
    } catch (e) {
      log('Error adding appointment: $e');
    }
  }

  getAllAppoiment() async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        listOfAppoiment = await ser.getAllAppoiment(userId: currentUser.uid);
        log(listOfAppoiment.length.toString());
        log('Appointments retrieved for user: ${currentUser.uid}');
        notifyListeners();
      } else {
        log('No user is logged in.');
      }
    } catch (e) {
      log('Error retrieving appointments: $e');
    }
  }
}
