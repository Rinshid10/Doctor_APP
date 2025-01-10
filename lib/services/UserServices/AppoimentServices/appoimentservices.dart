import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/model/Appoiment/appoiment.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Appoimentservices {
  CollectionReference refere =
      FirebaseFirestore.instance.collection('SlotBooking');
  FirebaseAuth firebaseStores = FirebaseAuth.instance;
  Future addAppoiment(AppoimentForUser model) async {
    try {
      var currentUser = firebaseStores.currentUser;
      if (currentUser != null) {
        model.userId = currentUser.uid;
        await refere.add(model.toFireStore());
        log('Appointment saved for user: ${currentUser.uid}');
      } else {
        log('No user is currently logged in');
      }
    } on FirebaseException catch (e) {
      log('Error in adding appointment: ${e.message}---${e}');
    }
  }

  Future<List<AppoimentForUser>> getAllAppoimentForAdmin() async {
    try {
      final QuerySnapshot datas = await refere.get();
      log('data fetch succes in admin appoimentGetALl $datas');
      return datas.docs
          .map((e) =>
              AppoimentForUser.fromFireStore(e.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      log('errro in appoiment for Admin $e');
    }
    return [];
  }

  Future<List<AppoimentForUser>> getAllAppoiment({
    required String userId,
  }) async {
    try {
      final QuerySnapshot datas =
          await refere.where('userId', isEqualTo: userId).get();

      log('Appointments retrieved for user: $userId');

      return datas.docs
          .map((e) =>
              AppoimentForUser.fromFireStore(e.data() as Map<String, dynamic>))
          .toList();
    } on FirebaseException catch (e) {
      log('Error in getting appointments: ${e.message}---$e');
    }
    return [];
  }
}
