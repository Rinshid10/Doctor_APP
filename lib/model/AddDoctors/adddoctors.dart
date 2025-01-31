class AdddoctorsModel {
  String? doctorName;
  String? doctorSpecilist;
  String? doctorExperiance;
  String? doctorPatinents;
  String? categeries;
  String? images;
  String? about;
  AdddoctorsModel({
    required this.about,
    required this.categeries,
    required this.doctorExperiance,
    required this.doctorName,
    required this.doctorPatinents,
    this.images,
    required this.doctorSpecilist,
  });

  factory AdddoctorsModel.fromFireStore(Map<String, dynamic> firestore) {
    return AdddoctorsModel(
        about: firestore['about'],
        categeries: firestore['categeries'],
        doctorExperiance: firestore['doctorExperiance'],
        
        doctorName: firestore['doctorName'],
        doctorPatinents: firestore['doctorPatinents'],
        doctorSpecilist: firestore['doctorSpecilist'],
        images: firestore['images']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      "doctorName": doctorName,
      "doctorSpecilist": doctorSpecilist,
      "doctorExperiance": doctorExperiance,
      "doctorPatinents": doctorPatinents,
      "images": images,
      "categeries": categeries,
      "about": about
    };
  }
}
