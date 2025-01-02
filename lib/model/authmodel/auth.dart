class Userdetailsmodels {
  String? uid;
  String? username;
  String? email;
  String? phonenumber;

  Userdetailsmodels({this.uid, this.username, this.email, this.phonenumber});

  Map<String, dynamic> toFireStore() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'phonenumber': phonenumber,
    };
  }

  factory Userdetailsmodels.fromFireStore(Map<String, dynamic> data) {
    return Userdetailsmodels(
      uid: data['uid'],
      username: data['username'],
      email: data['email'],
      phonenumber: data['phonenumber'],
    );
  }
}
