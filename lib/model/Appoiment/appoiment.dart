class AppoimentForUser {
  dynamic date;
  dynamic day;
  dynamic time;
  dynamic month;
  AppoimentForUser(
      {required this.date,
      required this.day,
      required this.time,
      required this.month});
  factory AppoimentForUser.fromFireStore(Map<String, dynamic> firestore) {
    return AppoimentForUser(
        month: firestore['month'],
        date: firestore['date'],
        day: firestore['day'],
        time: firestore['time']);
  }
  Map<String, dynamic> toFireStore() {
    return {
      "month": month,
      "date": date,
      "time": time,
      "day": day,
    };
  }
}
