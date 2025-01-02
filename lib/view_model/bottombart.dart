import 'package:flutter/material.dart';

class BottombartProvider extends ChangeNotifier {
  int curruntIndex = 0;
  void onchanged(int index) {
    curruntIndex = index;
    notifyListeners();
  }
}
