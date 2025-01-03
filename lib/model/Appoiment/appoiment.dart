class AppoimentForUser {
  dynamic date;
  dynamic day;
  dynamic time;
  dynamic month;
  String? userId;

  AppoimentForUser(
      {required this.date,
      required this.day,
      required this.time,
      required this.month,
      this.userId});

  factory AppoimentForUser.fromFireStore(Map<String, dynamic> firestore) {
    return AppoimentForUser(
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
    };
  }
}
