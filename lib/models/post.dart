import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  // late String _id;
  // String get id => _id; //? Future implementation
  String title;
  String? description;
  List<String>? photoUrls;
  String postByUid;
  DateTime postTime;
  bool isAnonymous;

  Post({
    required this.title,
    this.photoUrls,
    required this.postByUid,
    DateTime? postTime,
    this.description,
    required this.isAnonymous,
  }) : this.postTime = postTime ?? DateTime.now();

  toJson() => {
        'title': title,
        'description': description,
        'photo_urls': photoUrls,
        'post_by_uid': postByUid,
        'post_time': Timestamp.fromDate(postTime),
        'is_anonymous': isAnonymous,
      };

  factory Post.fromJson(Map<String, dynamic> postMap) {
    Post post = Post(
      title: postMap['title'],
      postByUid: postMap['post_by_uid'],
      isAnonymous: postMap['is_anonymous'] ?? false,
      description: postMap['description'],
      photoUrls: ((postMap['photo_urls'] ?? []) as List).cast<String>(),
      postTime: postMap['post_time'],
    );
    return post;
  }
}
