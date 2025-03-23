import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
late Future<QuerySnapshot<Map<String, dynamic>>> postsFuture;

void initStreams() {
  postsFuture = firebaseFirestore
      .collection('posts')
      .orderBy('post_time')
      .limit(20)
      .get();
}
