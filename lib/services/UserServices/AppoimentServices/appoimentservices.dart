import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/model/Appoiment/appoiment.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Appoimentservices {
  CollectionReference refere =
      FirebaseFirestore.instance.collection('SlotBooking');
  FirebaseAuth firebaseStores = FirebaseAuth.instance;

  Future addData() async {
    try {
      var a = firebaseStores.currentUser;
      log(a.toString());
    } catch (e) {
      log('error');
    }
  }

  Future addAppoiment(AppoimentForUser model) async {
    try {
      await refere.add(model.toFireStore());
      addData();
      log('Appoiment saved');
    } on FirebaseException catch (e) {
      log('error in adding appoinment ${e.message}---${e}');
    }
  }

  Future<List<AppoimentForUser>> getAllAppoiment() async {
    try {
      final QuerySnapshot datas = await refere.get();
      log(' get all appoiment succes  $datas');
      return datas.docs
          .map((e) =>
              AppoimentForUser.fromFireStore(e.data() as Map<String, dynamic>))
          .toList();
    } on FirebaseException catch (e) {
      log('error to get all appoiment ${e.message}--$e');
    }
    return [];
  }
}
