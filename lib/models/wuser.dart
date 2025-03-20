import 'package:cloud_firestore/cloud_firestore.dart';

class Wuser {
  // late String _id;
  // String get id => _id; //? Future implementation provision
  String name;
  String? profileUrl;
  DateTime? dob;
  String title;
  String? bio;
  List<String> interests;

  Wuser(
      {required this.name,
      this.profileUrl,
      this.dob,
      required this.title,
      this.bio,
      required this.interests});

  toJson() => {
        "name": name,
        "title": title,
        "profile_url": profileUrl,
        "bio": bio,
        "dob": dob != null ? Timestamp.fromDate(dob!) : null,
        "interests": interests,
      };
  factory Wuser.fromJson(Map<String, dynamic> wuserMap) {
    Wuser wuser = Wuser(
        name: wuserMap["name"],
        title: wuserMap["title"],
        interests: ((wuserMap["interests"] ?? []) as List).cast<String>(),
        bio: wuserMap["bio"],
        dob: wuserMap["dob"] != null
            ? (wuserMap["dob"] as Timestamp).toDate()
            : null,
        profileUrl: wuserMap["profile_url"]);
    // wuser._id = wuserMap['_id'];
    return wuser;
  }
}
