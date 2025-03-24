import 'package:cloud_firestore/cloud_firestore.dart';

enum AIFactCheck {
  accurate,
  mostlyAccurate,
  partiallyAccurate,
  notCorrect,
  copied,
  unverified
}

extension EnumParsing on AIFactCheck {
  String value() {
    return this.value().split('.').last;
  }

  static AIFactCheck fromString(String aiFactCheck) {
    return AIFactCheck.values
        .firstWhere((element) => element.value() == aiFactCheck);
  }
}

class Post {
  // late String _id;
  // String get id => _id; //? Future implementation
  String title;
  String? description;
  List<String>? photoUrls;
  String postByUid;
  AIFactCheck? aiFactCheck;

  String? aiSummary;
  DateTime postTime;
  String? location;
  bool isAnonymous;

  Post({
    required this.title,
    this.photoUrls,
    this.location,
    this.aiFactCheck,
    this.aiSummary,
    required this.postByUid,
    DateTime? postTime,
    this.description,
    required this.isAnonymous,
  }) : this.postTime = postTime ?? DateTime.now();

  toJson() => {
        'title': title,
        'description': description,
        'photo_urls': photoUrls,
        'location': location,
        'post_by_uid': postByUid,
        'post_time': Timestamp.fromDate(postTime),
        'is_anonymous': isAnonymous,
      };

  factory Post.fromJson(Map<String, dynamic> postMap) {
    Post post = Post(
      title: postMap['title'],
      postByUid: postMap['post_by_uid'],
      location: postMap['location'],
      aiFactCheck: postMap['ai_fact_check'],
      aiSummary: postMap['ai_summary'],
      isAnonymous: postMap['is_anonymous'] ?? false,
      description: postMap['description'],
      photoUrls: ((postMap['photo_urls'] ?? []) as List).cast<String>(),
      postTime: postMap['post_time'] != null
          ? (postMap['post_time'] as Timestamp).toDate()
          : null,
    );
    return post;
  }
}
