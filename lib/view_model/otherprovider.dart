import 'dart:developer';

import 'package:flutter/material.dart';

class Otherprovider extends ChangeNotifier {
  bool istrue = false;
  IconData boolIcons = Icons.visibility_off;
  void isBoolInPassword() {
    istrue = !istrue;
    boolIcons = istrue ? Icons.visibility : Icons.visibility_off;

    notifyListeners();
  }
}
