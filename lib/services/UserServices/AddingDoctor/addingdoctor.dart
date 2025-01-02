import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/model/AddDoctors/adddoctors.dart';

class AddingdoctorServices {
  CollectionReference firebaseData =
      FirebaseFirestore.instance.collection('AddingDoctor');

  Future addDoctor(AdddoctorsModel model) async {
    try {
      await firebaseData.add(model.toFirestore());
      log('Succes to add to firebase');
    } catch (e) {
      log('error to add $e');
    }
  }

  Future<List<AdddoctorsModel>> getDataFromFireBase() async {
    try {
      final QuerySnapshot snapshot = await firebaseData.get();
      return snapshot.docs
          .map((doc) =>
              AdddoctorsModel.fromFireStore(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      log("Error Fetching Data: $e");
      throw Exception("Error Fetching Data");
    }
  }
}
