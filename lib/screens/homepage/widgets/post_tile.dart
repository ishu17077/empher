import 'package:empher/constants/beautyTexts.dart';
import 'package:empher/models/post.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final Post post;
  const PostTile({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                maxRadius: 20,
                minRadius: 20,
                backgroundImage: AssetImage("assets/images/homer.png"),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Homer Girl",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      SizedBox(width: 5),
                      Icon(Icons.shield, color: Colors.white70, size: 17),
                      SizedBox(width: 5),
                      Text("•"),
                      SizedBox(width: 5),
                      Text(
                        "Follow",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 77, 190, 224)),
                      ),
                    ],
                  ),
                  Text("Posted ${beautyDate(post.postTime)}"),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            post.title,
            style: TextStyle(color: Colors.white, fontSize: 16.5),
          ),
          SizedBox(height: 5),
          Text(
            post.description ?? '',
            style: TextStyle(
              color: Colors.white.withAlpha(200),
            ),
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
