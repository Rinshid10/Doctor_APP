import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/model/authmodel/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Firebaseauthentication {
  FirebaseAuth firebaseStores = FirebaseAuth.instance;
  final firebaseData = FirebaseFirestore.instance;
  final String username = '';

  Future register(
      {required Userdetailsmodels model,
      required String emails,
      required String password,
      required String username,
      required String phonenumber}) async {
    try {
      UserCredential userCredential = await firebaseStores
          .createUserWithEmailAndPassword(email: emails, password: password);

      var currentUser = userCredential.user;

      if (currentUser != null) {
        model.uid = currentUser.uid;

        await firebaseData
            .collection('Users')
            .doc(currentUser.uid)
            .set(model.toFireStore());

        await verifyEmail();

        log('Registration successful');
      } else {
        log('No current user found after registration');
      }
    } on FirebaseAuthException catch (e) {
      log('Error during registration: $e');
      log(e.message.toString());
    }
  }

  Future login({required String emails, required String password}) async {
    try {
      await firebaseStores.signInWithEmailAndPassword(
          email: emails, password: password);
      log('Login successful');
    } on FirebaseAuthException catch (e) {
      log('Error in login: $e');
    }
  }

  Future verifyEmail() async {
    try {
      await firebaseStores.currentUser?.sendEmailVerification();
      log('Verification email sent');
    } on FirebaseAuthException catch (e) {
      log('Error sending verification email: $e');
    }
  }
}
