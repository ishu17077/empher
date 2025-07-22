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
  bool _isLoading = true;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () => postsFuture).then((value) {
      if (value.docs.isNotEmpty) {
        setState(() {
          _isLoading = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: !_isLoading
          ? AppBar(
              backgroundColor: kBackgroundColor,
              scrolledUnderElevation: 0.0,
              title: Text("Empher",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Cedarville Cursive",
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  )),
            )
          : null,
      body: SafeArea(
        child: FutureBuilder(
          future: Future.delayed(Duration(seconds: 3), () => postsFuture),
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
            return Column(children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        PostTile(post: posts[index]),
                        Divider(
                          color: const Color.fromARGB(255, 228, 102, 102),
                          thickness: 1,
                        ),
                        index + 1 == docs.length
                            ? SizedBox(height: 50)
                            : SizedBox(),
                      ],
                    );
                  },
                  itemCount: docs.length,
                ),
              ),
            ]);
          },
        ),
      ),
      floatingActionButton: !_isLoading
          ? FloatingActionButton(
              onPressed: () {},
              backgroundColor: kButtonColor,
              child: Icon(Icons.post_add, color: Colors.white),

              // RiveAnimation.asset( //? Future implementation
              //   'assets/icons.riv',
              //   artboard: 'CHAT',
              // )
            )
          : SizedBox(),
    );
  }
}
