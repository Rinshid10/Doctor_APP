import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Loginservices extends ChangeNotifier {
  Future register(password, email) async {
    try {
      await Supabase.instance.client.auth
          .signUp(password: password, email: email);
      log('register succes');

      notifyListeners();
    } on AuthApiException catch (e) {
      log(' error found in register ${e.message} + ${e.statusCode}');
    }
  }

  Future login(password, email) async {
    try {
      await Supabase.instance.client.auth
          .signUp(password: password, email: email);
      log('login suces');
      notifyListeners();
    } on AuthApiException catch (e) {
      log('erro found in login  ${e.message} ${e.statusCode} ');
    }
  }
}
