import 'dart:developer';

import 'package:flutter/material.dart';

class DateProvider with ChangeNotifier {
  DateTime? _selectedDate;
  int selectedSlot = 0;
  String selectedTime = '';
  String? selectedDateInDay = '';

  var pickdateDay = 0;
  var pickdateMonth = 0;
  String? monthFixed = '';

  void mont() {
    switch (pickdateMonth) {
      case 1:
        monthFixed = 'January';
        break;
      case 2:
        monthFixed = 'February';
        break;
      case 3:
        monthFixed = 'March';
        break;
      case 4:
        monthFixed = 'April';
        break;
      case 5:
        monthFixed = 'May';
        break;
      case 6:
        monthFixed = 'June';
        break;
      case 7:
        monthFixed = 'July';
        break;
      case 8:
        monthFixed = 'August';
        break;
      case 9:
        monthFixed = 'September';
        break;
      case 10:
        monthFixed = 'October';
        break;
      case 11:
        monthFixed = 'November';
        break;
      case 12:
        monthFixed = 'December';
        break;
      default:
        monthFixed = 'Invalid month';
    }

    notifyListeners();
  }

  DateTime? get selectedDate => _selectedDate;

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    mont();
    notifyListeners();
  }

  void setSelectedSlot(int slot) {
    selectedSlot = slot;
    getSlotTime();

    notifyListeners();
  }

  getSlotTime() {
    switch (selectedSlot) {
      case 0:
        selectedTime = '10:10 am';
        break;
      case 1:
        selectedTime = '10:30 am';
        break;
      case 2:
        selectedTime = '11:15 am';
        break;
      case 3:
        selectedTime = '11:50 am';
        break;
      case 4:
        selectedTime = '2:00 am';
        break;
      case 5:
        selectedTime = '2:50 am';
        break;
      default:
        return "";
    }
    notifyListeners();
  }
}
