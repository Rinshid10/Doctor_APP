import 'package:flutter/material.dart';

class DropdownAdmin extends ChangeNotifier {
  String? selectedCategory;

  final List<String> categories = [
    'Prediatrician',
    'Neurosurgeon',
    'Cardiologist',
    'Psychiatrist'
  ];

  void changeValue(newvales) {
    selectedCategory = newvales;
    notifyListeners();
  }
}
