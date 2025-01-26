import 'package:supabase_flutter/supabase_flutter.dart';

class AppoimentForUser {
  dynamic date;
  dynamic day;
  dynamic time;
  dynamic month;
  String? userId;
  String? patientName;
  String? patinentAge;
  String? doctorName;

  AppoimentForUser(
      {required this.date,
      required this.doctorName,
      required this.patientName,
      required this.patinentAge,
      required this.day,
      required this.time,
      required this.month,
      this.userId});

  factory AppoimentForUser.fromFireStore(Map<String, dynamic> firestore) {
    return AppoimentForUser(
        doctorName: firestore['doctorName'],
        patientName: firestore['patientName'],
        patinentAge: firestore['patinentAge'],
        month: firestore['month'],
        date: firestore['date'],
        day: firestore['day'],
        time: firestore['time'],
        userId: firestore['userId']);
  }

  Map<String, dynamic> toFireStore() {
    return {
      "month": month,
      "date": date,
      "time": time,
      "day": day,
      "userId": userId,
      'patinentAge': patinentAge,
      'patientName': patientName,
      'doctorName': doctorName
    };
  }
}
