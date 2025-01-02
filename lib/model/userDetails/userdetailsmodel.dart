class Userdetailsmodel {
  String? username;
  String? email;
  String? phonenumber;
  String? date;
  Userdetailsmodel(
      {required this.email,
      required this.phonenumber,
      required this.username,
      required this.date});
  factory Userdetailsmodel.FromfireSotre(Map<String, dynamic> fireStore) {
    return Userdetailsmodel(
        date: fireStore['date'],
        email: fireStore['email'],
        phonenumber: fireStore['phone'],
        username: fireStore['username']);
  }

  Map<String, dynamic> toFireStore() {
    return {
      "email": email,
      "phone": phonenumber,
      "username": username,
      "date": date
    };
  }
}
