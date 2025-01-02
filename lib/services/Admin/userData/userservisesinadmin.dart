import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/model/userDetails/userdetailsmodel.dart';

class Userservisesinadmin {
  CollectionReference firestore =
      FirebaseFirestore.instance.collection('Users');

  Future<List<Userdetailsmodel>> getAlluser() async {
    try {
      final QuerySnapshot datas = await firestore.get();
      return datas.docs
          .map((e) =>
              Userdetailsmodel.FromfireSotre(e.data() as Map<String, dynamic>))
          .toList();
    } on FirebaseException catch (e) {
      log('error to get userData  ${e.message}');
      throw Exception(e);
    }
  }
}
