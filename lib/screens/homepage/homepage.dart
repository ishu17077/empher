import 'package:empher/constants/colors.dart';
import 'package:empher/functions/firebase_calls.dart';
import 'package:empher/models/post.dart';
import 'package:empher/screens/homepage/widgets/custom_circular_progress_indicator.dart';

import 'package:empher/screens/homepage/widgets/post_tile.dart';
import 'package:flutter/material.dart';
// import 'package:rive/rive.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final CustomThreatFinder customThreatFinder = CustomThreatFinder();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        scrolledUnderElevation: 0.0,
        title: Text("Emper",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Cedarville Cursive",
              fontSize: 27,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: postsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              customThreatFinder.threatDetectorLoading(context);
              return SizedBox();
            } else if (snapshot.hasError) {
              return Center(
                  child: Text("Error loading data, please try again later."));
            }

            customThreatFinder.removeThreadDetectorLoading();
            // return Center(
            //     child: CustomCircularProgressIndicator(
            //         radius: 300, colors: [Colors.red]));
            var docs = snapshot.data!.docs;
            List<Post> posts =
                docs.map((doc) => Post.fromJson(doc.data())).toList();
            return ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    PostTile(post: posts[index]),
                    Divider(
                      color: const Color.fromARGB(255, 228, 102, 102),
                      thickness: 1,
                    ),
                  ],
                );
              },
              itemCount: docs.length,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 243, 102, 102),
        child: Icon(Icons.post_add, color: Colors.white),

        // RiveAnimation.asset( //? Future implementation
        //   'assets/icons.riv',
        //   artboard: 'CHAT',
        // )
      ),
    );
  }
}
