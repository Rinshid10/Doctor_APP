import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/model/authmodel/auth.dart';
import 'package:doctor_app/view/User/bottomNavigationbar/bottombar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Firebaseauthentication {
  FirebaseAuth firebaseStores = FirebaseAuth.instance;
  final firebaseData = FirebaseFirestore.instance;
  final String username = '';
  List<bool> ifTrue = [];
  List<bool> ifFalse = [];
  Future register(
      {required Userdetailsmodels model,
      required String emails,
      required String password,
      required String username,
      required String phonenumber}) async {
    try {
      UserCredential userCredential = await firebaseStores
          .createUserWithEmailAndPassword(email: emails, password: password);
      User? user = userCredential.user;

      if (user != null) {
        ifTrue = [true];
        log('varifyed');
      } else {
        ifTrue = [false];
        log('not veryfied');
      }

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

  Future login(
      {required String emails,
      required String password,
      required BuildContext context}) async {
    try {
      await firebaseStores.signInWithEmailAndPassword(
          email: emails, password: password);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Navigationpage()));
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
