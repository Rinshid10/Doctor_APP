import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/model/authmodel/auth.dart';
import 'package:doctor_app/model/userDetails/userdetailsmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Firebaseauthentication {
  FirebaseAuth firebaseStores = FirebaseAuth.instance;
  final firebaseData = FirebaseFirestore.instance;
  final username = '';

  Future register(
      {required Userdetailsmodels model,
      required String emails,
      required password,
      required String username,
      required String phonenumber}) async {
    try {
      var curruentUser = firebaseStores.currentUser;

      if (curruentUser != null) {
        model.uid;
      }
      await firebaseData
          .collection('Users')
          .doc(curruentUser?.uid)
          .set(model.toFireStore());
      await firebaseStores.createUserWithEmailAndPassword(
          email: emails, password: password);
      await verifyEmail();
      username = username;

      log('auth succes');
    } on FirebaseAuthException catch (e) {
      log('error to register $e');
      log(e.message.toString());
    }
  }

  Future login({required String emails, required String password}) async {
    try {
      await firebaseStores.signInWithEmailAndPassword(
          email: emails, password: password);
      log('login Succes');
    } on FirebaseAuthException catch (e) {
      log('error in login $e');
    }
  }

  Future verifyEmail() async {
    try {
      await firebaseStores.currentUser?.sendEmailVerification();
      log('verification mail send');
    } on FirebaseAuthException catch (e) {
      log('errror to send verification $e');
    }
  }
}
